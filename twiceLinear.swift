import Foundation

func dblLinear(_ n: Int) -> Int {
    
    var u = [1]
    var indY = 0, indZ = 0
    
    for _ in 0...n {
        let y = 2 * u[indY] + 1
        let z = 3 * u[indZ] + 1
        if y < z {
            u.append(y)
            indY += 1
        }
        if y > z {
            u.append(z)
            indZ += 1
        }
        if y == z {
            u.append(y)
            indZ += 1
            indY += 1
        }
    }
    print(u)
    return u[n]
}

print(dblLinear(10))
