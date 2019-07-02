//
//  HeapSort.swift
//  算法
//
//  Created by iOS-UI on 2019/5/16.
//  Copyright © 2019 iOS. All rights reserved.
//

/// 堆排序 算法
import Foundation


/// “下沉” 调整
///
/// - Parameters:
///   - ary: 数组
///   - parIndex: “下沉”的父节点
///   - length: 堆的有效大小
private func downAdjust(items: inout [Int], startIndex: Int, endIndex: Int) {
    
    let temp = items[startIndex]
    
    //父节点下标
    var fatherIndex = startIndex + 1
    
    //左孩子下标
    var maxChildIndex = 2 * fatherIndex
    
    while maxChildIndex <= endIndex {
        
        //比较左右孩子并找出比较大的下标
        if maxChildIndex < endIndex && items[maxChildIndex-1] < items[maxChildIndex] {
    
            maxChildIndex = maxChildIndex + 1
        }
        
        //如果较大的那个子节点比根节点大，就将该节点的值赋给父节点
        if temp < items[maxChildIndex-1] {
            
            items[fatherIndex-1] = items[maxChildIndex-1]
        } else {
            
            break
        }
        
        fatherIndex = maxChildIndex
        maxChildIndex = 2 * fatherIndex
    }
    
    items[fatherIndex-1] = temp
}


func heapSort(ary: [Int]) -> [Int] {
    
    var array = ary
    
    /// 把无序数组构建成最大堆
    for i in (0...ary.count/2).reversed() {
        
        downAdjust(items: &array, startIndex: i, endIndex: array.count - 1)
    }
    
    /// 循环删除堆顶元素，移到集合尾部，调整堆生产新的堆顶
    for i in (0...ary.count - 1).reversed() {
        
        /// 最后一个元素和第一个元素进行交换
        array.swapAt(i, 0)
        
        /// “下沉”调整最大堆
        downAdjust(items: &array, startIndex: 0, endIndex: i)
    }
    
    return array
}

