import Foundation

//t - max sum, t >= 0, k - number of towns to visit, k >= 1, ls - list of distances
func chooseBestSum(_ t: Int, _ k: Int, _ ls: [Int]) -> Int {
    
    // var resultSum = 0
    
    var arr = [[Int]]()
    
    var arrOfSums = [Int]()
    var tmp = [Int]()
    var sum = 0
    for i in 0..<ls.count-1 {
        tmp.removeAll()
        tmp.append(ls[i])
        sum = ls[i]
        for j in i+1..<ls.count {
            if sum + ls[j] <= t {
                tmp.append(ls[j])
                sum += ls[j]
            }
            if tmp.count == k {
                arr.append(tmp)
                arrOfSums.append(sum)
                tmp.removeAll()
                tmp.append(ls[i])
                sum = ls[i]
            }
        }
    }
    print(arr)
    print(arrOfSums)
    return Int()
}

var ts = [50, 55, 56, 57, 58]
print(chooseBestSum(163, 3, ts))
