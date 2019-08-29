import Foundation

func lastDigit<S>(_ numbers: S) -> Int where S: Sequence, S.Iterator.Element == Int {
    var iterator = numbers.makeIterator()
    let start = iterator.next()
    
    var zeroFixed = sequence(state: (iterator, start)) { (state: inout (iterator: S.Iterator, current: Int?)) -> Int? in
        guard let current = state.current else { return 1 }
        state.current = state.iterator.next()
        guard let next = state.current, next == 0 else { return current }
        var count = 1
        while state.iterator.next() == 0 {
            count += 1
        }
        state.current = nil
        if count % 2 == 0 {
            return current
        } else {
            return 1
        }
    }
    
    let first = zeroFixed.next()! % 10
    var second: Int = 0
    
    switch zeroFixed.next()! % 4 {
    case 0: second = 4
    case 1: second = 1
    case 2: second = zeroFixed.next()! == 1 ? 2 : 4
    case 3: second = zeroFixed.next()! % 2 == 0 ? 1 : 3
    default: break
    }
    
    return Int(pow(Double(first), Double(second))) % 10
}


print(lastDigit([12,30,21])) // 6
print(lastDigit([7]))  // 7
print(lastDigit([2,2,2,0])) // 4
