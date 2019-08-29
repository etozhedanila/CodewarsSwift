import Foundation

//  x^2 - 4y^2 = n
//  (x-2y)(x+2y) = n
//  x-2y=i
//  x+2y=j
//  => 4y = j - i, y = (j - i) / 4, x = i + 2y

func solequa(_ n: Int) -> [(Int, Int)] {
    var result = [(Int, Int)]()
    for i in 1...Int(sqrt(Double(n))) {
        if n % i == 0 {
            let j = n / i
            let y = (j - i) / 4
            let x = i + 2 * y
            if x >= 0, y >= 0, j == x + 2 * y, i == x - 2 * y {
                result.append((x, y))
            }
        }
    }
    return result
}

print(solequa(13))
