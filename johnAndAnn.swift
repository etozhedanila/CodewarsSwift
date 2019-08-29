import Foundation

func getArrays(_ n: Int) -> [[Int]] {
    var ann = [1]
    var john = [0]
    for i in 1..<n {
        john.append(i - ann[john[i - 1]])
        ann.append(i - john[ann[i - 1]])
        
    }
    return [ann, john]
}

func ann(_ n : Int) -> [Int] {
    
    return getArrays(n)[0]
}

func john(_ n : Int) -> [Int] {
    
    return getArrays(n)[1]
}

func sumJohn(_ n : Int) -> Int {
    
    return getArrays(n)[1].reduce(into: 0, { (sum, elem) in
        sum += elem
    })
}

func sumAnn(_ n : Int) -> Int {
    
    //    return getArrays(n)[0].reduce(into: 0, { (sum, elem) in
    //        sum += elem
    //    })
    return getArrays(n)[0].reduce(0, +)
}

print(john(11))
print(ann(6))
print(sumJohn(75))
print(sumAnn(150))
