import Foundation

func digPow(for number: Int, using power: Int) -> Int {
    var num = number
    var result = 0
    var p = Double(power)
    while num > 0 {
        result = result * 10 + num % 10
        num = num / 10
    }
    num = result
    
    result = 0
    while num > 0 {
        result += Int(pow(Double(num % 10), p))
        p += 1
        num /= 10
    }
    
    return result % number == 0 ? result / number : -1
}

print(digPow(for: 695, using: 2))
print(digPow(for: 92, using: 1))
print(digPow(for: 46288, using: 3))
