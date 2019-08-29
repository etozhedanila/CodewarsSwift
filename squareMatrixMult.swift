import Foundation

func matrixMultiplication(_ a:[[Int]], _ b:[[Int]]) -> [[Int]] {
    let n = a.count
    var mult = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                mult[i][j] += a[i][k] * a[k][j]
            }
        }
    }
    return mult
}
