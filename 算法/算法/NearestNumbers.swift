//
//  NearestNumbers.swift
//  算法
//
//  Created by iOS-UI on 2019/5/21.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
/*
 不对。
*/

#warning("不对呢")


func findNearestNumber(numbers: [Int]) -> [Int] {
    
    let index = findTransferPoint(numbers)
    
    if index == 0 { return [0] }
    
    var numberCopy = numbers
    
    numberCopy = exchangeHead(numberCopy, index: index)
    
    numberCopy = numberCopy.sorted { (s1, s2) -> Bool in
        return s1 > s2
    }
    
    return numberCopy
}

private func findTransferPoint(_ numbers: [Int]) -> Int {
    
    for i in (0...numbers.count - 1).reversed() {
        
        if (numbers[i] > numbers[i - 1]) {
            return i
        }
    }
    return 0
}

private func exchangeHead(_ tempNums: [Int], index: Int) -> [Int] {
    
    var numbers = tempNums
    let head = numbers[index - 1]
    
    for i in (0...numbers.count - 1).reversed() {
        
        if (head < numbers[i]) {
            
            numbers[index - 1] = numbers[i]
            numbers[i] = head
            break
        }
    }
    return numbers
}


private func reverse(_ tempNums: [Int], index: Int) -> [Int] {
    
    
    
    return [1]
}
