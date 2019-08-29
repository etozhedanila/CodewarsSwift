//
//  stringMix.swift
//  
//
//  Created by Виталий Субботин on 29/08/2019.
//

import Foundation

func resultToString(_ r: [String: Int]) -> String {
    
    if r.count == 0 { return "" }
    
    var tmpArr: [(Int, String)] = []
    for (key, value) in r {
        tmpArr.append((value, key))
    }
    tmpArr = tmpArr.sorted(by: { $0.1.count > $1.1.count })
    tmpArr = tmpArr.sorted(by: {$0.0 < $1.0 && $0.1.count == $1.1.count})
    var result = ""
    for elem in tmpArr.sorted(by: {$0.1 < $1.1 && $0.1.count == $1.1.count && $0.0 == $1.0}) {
        let sep = elem.0 == 3 ? "E" : "\(elem.0)"
        result += sep + ":" + elem.1 + "/"
    }
    
    result.removeLast()
    
    return result
}

func mix(_ s1: String, _ s2: String) -> String {
    var s1Letters: [String: Int] = [:]
    var s2Letters: [String: Int] = [:]
    let firstString = s1.replacingOccurrences(of: " ", with: "")
    let secondString = s2.replacingOccurrences(of: " ", with: "")
    
    for elem in firstString {
        if elem < "a" {
            continue
        }
        if s1Letters[String(elem)] != nil {
            s1Letters[String(elem)]! += 1
        }
        else {
            s1Letters[String(elem)] = 1
        }
    }
    
    
    for elem in secondString {
        if elem < "a" {
            continue
        }
        if s2Letters[String(elem)] != nil {
            s2Letters[String(elem)]! += 1
        }
        else {
            s2Letters[String(elem)] = 1
        }
    }
    
    s1Letters = s1Letters.filter { $0.value > 1 }
    s2Letters = s2Letters.filter { $0.value > 1 }
    
    var result: [String: Int] = [:]
    
    for (key, value) in s1Letters {
        var tmp: String = ""
        if s2Letters[key] != nil {
            
            if value > s2Letters[key]! {
                tmp = String.init(repeating: key, count: value)
                result[tmp] = 1
            }
            else {
                tmp = String.init(repeating: key, count: s2Letters[key]!)
                if value == s2Letters[key]! {
                    result[tmp] = 3
                }
                else {
                    result[tmp] = 2
                }
            }
            
        }
        else {
            tmp = String.init(repeating: key, count: value)
            result[tmp] = 1
        }
    }
    
    for (key, value) in s2Letters {
        var tmp: String = ""
        if s1Letters[key] == nil {
            
            tmp = String.init(repeating: key, count: value)
            result[tmp] = 2
            
        }
        
    }
    
    return resultToString(result)
}


print(mix("Are they here", "yes, they are here"))
print(mix("looping is fun but dangerous", "less dangerous than coding"))
print(mix(" In many languages", " there's a pair of functions"))
print(mix("codewars", "codewars"))
