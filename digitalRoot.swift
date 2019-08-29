import Foundation

func digitalRoot(of number: Int) -> Int {
    var num = number
    var result = 0
    while num > 0 {
        result += num % 10
        num /= 10
    }
    if result > 9 {
        return digitalRoot(of: result)
    }
    
    return result
}

print(digitalRoot(of: 456))
