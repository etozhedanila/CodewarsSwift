//
//  File.swift
//  
//
//  Created by Виталий Субботин on 03.11.2018.
//

import Foundation
//import UIKit

func power(number n: Int, power p: Int) -> Int {
    let degree = p < 4 ? p : p % 4 + 4
    
    return Int(pow(Double(n), Double(degree)))
}

func lastDigit<S>(_ numbers: S) -> Int where S: Sequence, S.Iterator.Element == Int {
    var p = 1
    let array = numbers.reversed()
    
    if array.count == 0 {
        return 1
    }
    
    for elem in array {
        
        
        p = power(number: elem, power: p )
    }
    
    return p % 10
    
}


print(lastDigit([12,30,21])) // 6
print(lastDigit([7,11,2]))  // 7
print(lastDigit([2,2,2,0])) // 4

