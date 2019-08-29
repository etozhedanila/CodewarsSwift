import Foundation

func tribonacci(_ signature: [Int], _ n: Int) -> [Int] {
    if n == 0 {
        return []
    }
    if n < signature.count {
        return Array(signature.prefix(upTo: n))
    }
    
    if signature.count < n {
        let tmp = Array(signature.suffix(from: signature.count - 3))
        let sum = tmp.reduce(0) { (result, next) -> Int in
            return result + next
        }
        var new = signature
        new.append(sum)
        
        
        return tribonacci(Array(new), n)
    }
    
    
    return signature
}

print(tribonacci([1,1,1], 10))
print(tribonacci([1,1,1], 1))
