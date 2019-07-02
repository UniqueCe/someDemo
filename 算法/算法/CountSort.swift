//
//  CountSort.swift
//  算法
//
//  Created by iOS-UI on 2019/5/16.
//  Copyright © 2019 iOS. All rights reserved.
//

/// 计数排序
import Foundation
/*
 有问题~~！！！！
 */

#warning("不对呢")

func countSort(ary: [Int])  -> [Int] {
    
    var max = ary[0]
    
    for i in 1...ary.count - 1 {
        
        if (ary[i] > max) {
        
            max = ary[i]
        }
    }
    
    var countArray = [Int](repeating: 0, count: max + 1)
    
    for i in 0...ary.count - 1 {
        
        countArray[ary[i]] += 1
    }
    
//    var index = 0
    let sortedArray = [Int](repeating: 0, count: ary.count)
//
//    for i in 0...countArray.count - 1 {
//
//        for _ in 0...countArray[i] {

//            index += 1
//            sortedArray[index] = i
//            print(countArray[i], i)
//        }
//        print(i)
//    }
    
    return sortedArray
}
