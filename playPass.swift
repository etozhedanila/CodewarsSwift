import Foundation

func playPass(_ s: String, _ n: Int) -> String {
    var result = ""
    var i = 0
    for char in s {
        if char >= "a" && char <= "z" || char >= "A" && char <= "Z" {
            for c in char.unicodeScalars {
                var val = c.value + UInt32(n)
                if val > 122 {
                    val = val % 122 + 97 - 1
                }
                else if val > 90 && val < 97 {
                    val = val % 90 + 65 - 1
                }
                let tmp = UnicodeScalar.init(val)
                result.append(tmp!.description)
            }
        }
        else if char >= "0" && char <= "9"  {
            
            result.append("\(9 - Int(char.description)!)")
        }
        else {
            result.append(char)
        }
    }
    
    var tmp: String
    var newResult = ""
    
    for elem in result.reversed() {
        tmp = i % 2 == 0 ? String(elem).lowercased() : String(elem).uppercased()
        newResult.append(tmp)
        i += 1
    }
    return newResult
}

print(playPass("MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015",  2))
