//
//  next_bigger_number.swift
//  
//
//  Created by Виталий Субботин on 24.07.2020.
//

import Foundation

extension Int {
    var digits: [Int] {
        var digits: [Int] = []
        var number = self
        while number != 0 {
            digits.insert(number % 10, at: 0)
            number /= 10
        }
        return digits
    }
    
    static func number(from array: [Int]) -> Int {
        let number = array
            .reversed()
            .enumerated()
            .reduce(into: 0) { $0 += $1.element * Int(pow(Double(10), Double($1.offset))) }
        return number
    }
 }

func nextBigger(num: Int) -> Int? {
    guard num >= 0 else { return nil }
    var nextBiggerPermutation: Int?
    var digits = num.digits
    var i = 1
    for index in 1..<digits.count {
        if digits[index - 1] < digits[index], index > i {
            i = index
        }
    }
    var j = 0
    for index in i..<digits.count {
        if digits[i - 1] < digits[index], index > j {
            j = index
        }
    }
    digits.swapAt(j, i - 1)
    let resultDigits = digits[0..<i] + digits[i..<digits.count].reversed()
    nextBiggerPermutation = Int.number(from: Array(resultDigits))
    guard num < nextBiggerPermutation ?? 0 else { return nil }
    return nextBiggerPermutation
}


assert(nextBigger(num: 12) == 21)
assert(nextBigger(num: 1234567890) == 1234567908)
assert(nextBigger(num: 2017) == 2071)
assert(nextBigger(num: 4000) ==  nil)
assert(nextBigger(num: 144) == 414)
