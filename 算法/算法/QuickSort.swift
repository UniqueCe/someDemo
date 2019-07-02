//
//  QuickSort.swift
//  算法
//
//  Created by iOS-UI on 2019/5/15.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

/*
    单循环使用的时间比双循环用时较短
    单循环和双循环的快速排序都是依靠递归来实现的
 
 */

/// 快速排序 （双边循环）
///
/// - Parameter items: 要处理的数字
/// - Returns: 返回处理完成的数组
func sort(items: [Int]) -> [Int] {
    
    var list = items
    print("快速排序开始：", getTimes())
    quickSort(list: &list, low: 0, high: list.count-1)
    print("快速排序结束！", getTimes())
    
    return list
}

/// 快速排序 （单边循环）
///
/// - Parameter items: 要处理的数字
/// - Returns: 返回处理完成的数组
func sortUnilateralCycle(items: [Int]) -> [Int] {
    
    var list = items
    print("快速排序-单边循环-开始：", getTimes())
    quickSort(list: &list, low: 0, high: list.count-1)
    print("快速排序-单边循环-结束！", getTimes())
    
    return list
}







/// 快速排序 （双边循环）
///
/// - parameter list: 要排序的数组
/// - parameter low: 数组的开始下标
/// - parameter high: 数组结束下标
private func quickSort(list: inout [Int], low: Int, high: Int) {
    
    if low < high {
        
        let mid = partition(list: &list, low: low, high: high)
        quickSort(list: &list, low: low, high: mid - 1)   //递归前半部分
        quickSort(list: &list, low: mid + 1, high: high)  //递归后半部分
    }
}

/// 将数组以第一个值为准分成两部分，前半部分比该值要小，后半部分比该值要大
///
/// - parameter list: 要二分的数组
/// - parameter low:  数组的下界
/// - parameter high: 数组的上界
///
/// - returns: 分界点
private func partition(list: inout [Int], low: Int, high: Int) -> Int {
    
    var low = low
    var high = high
    let temp = list[low]
    
    print("low[\(low)]:\(list[low]), high[\(high)]:\(list[high])")
    
    while low < high {
        
        while low < high && list[high] >= temp {
            high -= 1
        }
        list[low] = list[high]
        
        while low < high && list[low] <= temp {
            low += 1
        }
        list[high] = list[low]
    }
    
    list[low] = temp
    
    print("mid[\(low)]:\(list[low])")
    print("\(list)\n")
    
    return low
}









/// 快速排序 （单边循环）
///
/// - parameter list: 要排序的数组
/// - parameter low: 数组的开始下标
/// - parameter high: 数组结束下标
private func quickSortUnilateralCycle(list: inout [Int], low: Int, high: Int) {
    
    if low < high {
        
        let mid = partitionUnilateralCycle(data: &list, low: low, high: high)
        quickSort(list: &list, low: low, high: mid - 1)   //递归前半部分
        quickSort(list: &list, low: mid + 1, high: high)  //递归后半部分
    }
}


/// 快速排序 （单边循环）
///
/// - Parameters:
///   - data: 数组
///   - low: 开始下标
///   - high: 结束下标
/// - Returns: 返回分界点
private func partitionUnilateralCycle(data: inout [Int], low: Int, high: Int) -> Int {
    
    let root = data[high]
    var index = low
    
    for i in low...high {
        if data[i] < root {
            
            if i != index {
                data.swapAt(i, index)
            }
            index = index+1
        }
    }
    
    if high != index {
        data.swapAt(high, index)
    }
    
    return index
}

