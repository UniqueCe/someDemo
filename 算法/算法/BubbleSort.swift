//
//  BubbleSort.swift
//  算法
//
//  Created by iOS-UI on 2019/5/14.
//  Copyright © 2019 iOS. All rights reserved.
//

// 冒泡排序
import Foundation

func BubbleSortOne(_ array: [Int]) -> [Int] {
    /*
     外部循环控制所有回合，内部循环实现每一轮的冒泡处理
     先进行元素比较，在进行元素交换。
     */
    print(getTimes(), "--第一版-开始--")
    var numbersArray = array
    
    for i in 0...(numbersArray.count - 2) {
    
        for j in 0...(numbersArray.count - i - 2){
        
            if numbersArray[j] > numbersArray[j + 1] {
            
                numbersArray.swapAt(j, j + 1)
            }
        }
    }
    print(getTimes(), "==第一版=结束==")
    return numbersArray
}


/// 冒泡排序  第二版
func BubbleSortSecond(_ array: [Int]) -> [Int] {
    /*
     外部循环控制所有回合，内部循环实现每一轮的冒泡处理
     先进行元素比较，在进行元素交换。
     */
    print(getTimes(), "--第二版-开始--")
    var numbersArray = array
    
    for i in 0...(numbersArray.count - 2) {
        
        // 有序标记，每一轮的初始值都是true
        var isSorted: Bool = true
        
        for j in 0...(numbersArray.count - i - 2){
            
            if numbersArray[j] > numbersArray[j + 1] {
                
                numbersArray.swapAt(j, j + 1)
                /// 因为有元素进行交换，所以不是有序的，标记为false
                isSorted = false
            }
        }
        
        if isSorted { break }
    }
    print(getTimes(), "==第二版=结束==")
    return numbersArray
}

/// 冒泡排序  第三版
func BubbleSortThird(_ array: [Int]) -> [Int] {
    /*
     外部循环控制所有回合，内部循环实现每一轮的冒泡处理
     先进行元素比较，在进行元素交换。
     */
    print(getTimes(), "--第三版-开始--")
    var numbersArray = array
    
    for i in 0...(numbersArray.count - 2) {
        
        /// 有序标记，每一轮的初始值都是true
        var isSorted: Bool = true
        /// 无序数组的边界，每次比较只需要比较到这里位置
        var sortBorder: Int = numbersArray.count - i - 2
        
        for j in 0...sortBorder {
            
            if numbersArray[j] > numbersArray[j + 1] {
                
                numbersArray.swapAt(j, j + 1)
                /// 因为有元素进行交换，所以不是有序的，标记为false
                isSorted = false
                /// 把无序数列的边界更新为最后一次交换元素的位置
                sortBorder = j
            }
        }
        
        if isSorted { break }
    }
    print(getTimes(), "==第三版=结束==")
    return numbersArray
}

/// 冒泡排序  升级版 鸡尾酒排序
func BubbleSortUpgradedVersion(_ array: [Int]) -> [Int] {

    /*
     鸡尾酒排序的元素比较和交换过程是双向的
     适用于 大部分元素已经有序的情况
     */
    print(getTimes(), "--第四版-开始--")
    var numbersArray = array
    
    var left:Int = 0
    var right:Int = numbersArray.count - 1
    var index:Int = 0
    
    while left < right {
        
        for  i in left..<right {
            if numbersArray[i] > numbersArray[i + 1] {
                numbersArray.swapAt(i, i + 1)
                index = i
            }
        }
        
        right = index
        let temp:Int = left + 1
        if temp < right {
            for i in (temp...right).reversed() {
                if numbersArray[i] < numbersArray[i-1] {
                    numbersArray.swapAt(i, i-1)
                    index = i
                }
            }
            left = index
        }
    }
    print(getTimes(), "==第四版=结束==")
    
    return numbersArray
}



func getTimes() -> String {
    
    let date = Date()
    
    let timeFormatter = DateFormatter()
    
    timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    
    let strNowTime = timeFormatter.string(from: date)
    
    return strNowTime;
}
