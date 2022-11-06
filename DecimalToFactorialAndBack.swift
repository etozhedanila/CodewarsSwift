import Foundation

// https://www.codewars.com/kata/54e320dcebe1e583250008fd/train/swift

func dec2FactString(_ nb: Int) -> String {
    var nb = nb
    var devider = 1
    var result = ""
    while nb > 0 {
        let rem = nb % devider
        nb = nb / devider
        let remStr = rem.str
        result += remStr
        devider += 1
    }
    return String(result.reversed())
}

func factString2dDec(_ s: String) -> Int {
    let coefficients: [Int] = s.array.compactMap { $0.int }.reversed()
    let result = coefficients
        .enumerated()
        .reduce(0) {
            $0 + $1.element * $1.offset.factorial()
        }
    return result
}

extension String {
    
    var array: [String] {
        self.map { String($0) }
    }
    
    var int: Int? {
        guard self.count == 1 else { return nil }
        if let number = Int(self) {
            return number
        }
        else {
            return String.dict[self]
        }
    }
    
    static let dict = String.createDict()
    
    static func createDict() -> [String: Int] {
        let startLetter = "A".unicodeScalars
        let endLetter = "Z".unicodeScalars
        
        let start = startLetter[startLetter.startIndex].value
        let end = endLetter[endLetter.startIndex].value
        
        var dict: [String: Int] = [:]
        var value = 10
        (start...end).forEach {
            if let scalar = UnicodeScalar($0) {
                let char = String(scalar)
                dict[char] = value
                value += 1
            }
        }
        return dict
    }
    
}

extension Int {
    
    func factorial() -> Int {
        if self == 0 { return 1 }
        return (1...self).reduce(1, *)
    }
    
    var str: String {
        if (0...9).contains(self) { return "\(self)" }
        return Int.dict[self] ?? ""
    }
    
    static let dict = Int.createDict()
    
    static func createDict() -> [Int: String] {
        let startLetter = "A".unicodeScalars
        let endLetter = "Z".unicodeScalars
        
        let start = startLetter[startLetter.startIndex].value
        let end = endLetter[endLetter.startIndex].value
        
        var dict: [Int: String] = [:]
        var key = 10
        (start...end).forEach {
            if let scalar = UnicodeScalar($0) {
                let char = String(scalar)
                dict[key] = char
                key += 1
            }
        }
        return dict
    }
    
}

print(dec2FactString(2982)) // should print 4041000
print(dec2FactString(463)) // should print 341010
print(dec2FactString(36288000)) // should print A0000000000

print("\n-------------//------------\n")

print(factString2dDec("4041000")) // should print 2982
print(factString2dDec("27A0533231100")) // should print 1273928000
print(factString2dDec("341010")) // should print 463

