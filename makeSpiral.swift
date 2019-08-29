import Foundation

enum Duration {
    case right
    case down
    case left
    case up
}

func spiral(_ n:Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    var i = 0
    var j = -1
    var step = 0
    var duration: Duration = .right
    
    for _ in 0..<(n * n) {
        if duration == .right {
            if j + step < n - 1 && result[i][j + step + 1] != 1 && result[i + 1][j + step + 1] != 1 {
                
                result[i][j + 1] = 1
                j += 1
            }
            else {
                duration = .down
            }
        }
        
        if duration == .down {
            if i + step < n - 1 && result[i + step + 1][j] != 1 {
                result[i + 1][j] = 1
                i += 1
            }
            else {
                duration = .left
            }
        }
        
        if duration == .left {
            if j - step > 0 && result[i][j - step - 1] != 1 && result[i - 1][j - step - 1] != 1{
                result[i][j - 1] = 1
                j -= 1
            }
            else {
                duration = .up
                step = 1
            }
        }
        
        if duration == .up {
            if i - step > 0 && result[i - step - 1][j] != 1 {
                result[i - 1][j] = 1
                i -= 1
            }
            else {
                duration = .right
            }
        }
        print(i, j)
    }
    
    for row in result {
        print(row)
    }
    return result
}

let a = spiral(8)
print(a)
