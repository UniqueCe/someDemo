//
//  GreatestCommonDivisor .swift
//  算法
//
//  Created by iOS-UI on 2019/5/20.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

/// 组大公约数

func getterGreatestCommonDivisor (a: Int, b: Int) -> Int {
    
    if a == b {
        return a
    }
    
    if  a < b {
        return getterGreatestCommonDivisor(a: b, b: a)
    }
    
    if b == 0 {
        return a
    } else {
        if getterIsEven(num: a) { // 偶数
            if getterIsEven(num: b) {
                return getterGreatestCommonDivisor(a: a >> 1, b: b >> 1) << 1
            } else {
                return getterGreatestCommonDivisor(a: a >> 1, b: b)
            }
            
        } else {
            if getterIsEven(num: b) {
                return getterGreatestCommonDivisor(a: a, b: b >> 1)
            } else {
                return getterGreatestCommonDivisor(a: b, b: a - b)
            }
        }
    }
}

/// 求奇偶数
private func getterIsEven(num: Int) -> Bool {
    
    return (num % 2 == 0 ? true : false)
}
