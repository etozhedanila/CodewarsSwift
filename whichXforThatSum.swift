import Foundation

func solve(_ m: Double) -> Double {
    let d = 1 + 4 * m
    if d == 0 {
        return (1 + 2 * m) / (2 * m)
    }
    if d > 0 {
        let x1 = (1 + 2 * m + sqrt(d)) / (2 * m)
        let x2 = (1 + 2 * m - sqrt(d)) / (2 * m)
        return x1 < 1 ? x1 : x2
        
    }
    return Double()
}

print(solve(2))
