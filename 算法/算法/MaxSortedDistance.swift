//
//  MaxSortedDistance.swift
//  算法
//
//  Created by iOS-UI on 2019/5/20.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

/// 无序数组排序后的最大相邻差

class Bucket: NSObject {
    
    var min: Int?
    var max: Int?
}

func getterMaxSortedDistance(array: [Int]) -> String {
    
    /// 相邻两数
    var strNum = ""
    
    /// 1.得到数列的最大值和最小值
    var max = array[0]
    var min = array[0]
    
    for i in 0...array.count - 1 {
        
        if array[i] > max {
            
            max = array[i]
        }
        
        if array[i] < min {
            
            min = array[i]
        }
    }
    
    let d = max - min
    
    /// 如果max和min相等，说明数组所有元素都相等，返回0
    if d == 0 {
        return "最大相邻差0, 相邻两数为 0 - 0"
    }
    
    /// 2.初始化 桶
    let bucketNum = array.count
    var buckets = [Bucket](repeating: Bucket(), count: bucketNum)
    
    for i in 0...bucketNum - 1 {
        buckets[i] = Bucket()
    }
    
    /// 3.遍历原始数组，确定每个桶的最大值和最小值
    for i in 0...array.count - 1 {
        
        /// 确定数组元素所属的桶的下标
        let index = ((array[i] - min) * (bucketNum - 1) / d)
        
        if (buckets[index].min == nil || buckets[index].min! > array[i]) {
            
            buckets[index].min = array[i]
        }
        
        if (buckets[index].max == nil || buckets[index].max! < array[i]) {
            
            buckets[index].max = array[i]
        }
    }
    
    /// 4.遍历桶，找到最大差值
    var leftMax = buckets[0].max
    var maxDistance = 0
    
    for i in 0...buckets.count - 1 {
        
        if (buckets[i].min == nil) { continue }
        
        if (buckets[i].min! - leftMax! > maxDistance) {
            
            maxDistance = buckets[i].min! - leftMax!
            strNum = "\(buckets[i].min!) - \(leftMax!)"
        }
        
        leftMax = buckets[i].max
    }
    
    return "最大相邻差\(maxDistance), 相邻两数为 " + strNum
}
