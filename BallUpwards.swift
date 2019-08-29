import Foundation

func maxBall(_ v0: Int) -> Int {
    var h: Double = 0
    var t: Double = 0.1
    var max = h
    var tMax = t
    let v: Double = Double(v0) * 1000 / 3600
    repeat {
        h = v * t - 0.5 * 9.81 * t * t
        if h >= max {
            max = h
            tMax = t
            
        }
        t += 0.1
    } while h > 0
    return Int(tMax * 10)
    //return Int(Double(v0) * 100 / 360 / 9.81 * 10 + 0.5)
}

print(maxBall(15))
