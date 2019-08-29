import Foundation

struct RGB: CustomStringConvertible, Equatable {
    var r:Int
    var g:Int
    var b:Int
    init(_ r:Int, _ g:Int, _ b:Int) {
        self.r = r
        self.g = g
        self.b = b
    }
    static func ==(left:RGB, right:RGB) -> Bool {
        return left.r == right.r && left.g == right.g && left.b == right.b
    }
    var description: String {
        return "{R:\(r), G:\(g), B:\(b)}"
    }
}

func convert(_ str: String) -> Int {
    var result = 0, ind = 1
    var tmp: Int?
    for char in Array(str) {
        switch char {
        case "A":
            tmp = 10
        case "B":
            tmp = 11
        case "C":
            tmp = 12
        case "D":
            tmp = 13
        case "E":
            tmp = 14
        case "F":
            tmp = 15
            
        default:
            guard let num = Int("\(char)") else {
                break
            }
            tmp = num
            
        }
        result += tmp! * ind
        ind *= 16
    }
    return result
}

func hexStringToRGB(_ str:String) -> RGB {
    
    var red: String = ""
    var green: String = ""
    var blue: String = ""
    for (index,char) in str.enumerated() {
        if index == 1 || index == 2 {
            red.append(char)
        }
        if index == 3 || index == 4 {
            green.append(char)
        }
        if index == 5 || index == 6 {
            blue.append(char)
        }
    }
    
    
    
    let result = RGB(convert(red), convert(green), convert(blue))
    return result
}

let color = "#FF9933"
print(hexStringToRGB(color))
