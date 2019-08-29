import Foundation

func doubles(_ maxk: Int, _ maxn: Int) -> Double {
    var sumN: Double
    var sumK: Double = 0
    
    for k in 1...maxk {
        sumN = 0
        for n in 1...maxn {
            
            sumN += 1 / (Double(k) * pow(Double(n + 1), Double(2 * k)))
            //print("sumN: ", sumN)
        }
        sumK += sumN
    }
    return sumK
}

print(doubles(1, 3))
print(doubles(1, 10))
print(doubles(10, 100))
