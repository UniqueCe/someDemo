//
//  RemoveKNumber .swift
//  算法
//
//  Created by iOS-UI on 2019/5/27.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
/*
    删去k个数字后的最小值
 
 */

func removeKDigits(numStr: String, k: Int) -> String {
    
    var tempK = k
    /// 新整数的最终长度 = 原长度 - K
    let newLength = numStr.count - tempK
    
    /// 创建一个数组，用来接受所有的数字
    var stack = [Int](repeating: 0, count: numStr.count)
    
    var top = 0
    
    for i in numStr {
        
        let c: Int = (Int("\(i)")) ?? 0
        
        /// 当栈顶数字大于遍历到当前数字时，栈顶数字出栈（相当于删除数字）
        if top > 0 {
            
            print( stack[top - 1], c )
        }
        while (top > 0 && stack[top - 1] > c && tempK > 0) {

            top -= 1
            tempK -= 1
            print( stack[top - 1],"----" )
        }
        
        /// 遍历到的当前数字入栈
        top += 1
        stack[top] = c
    }
    
    /// 找到占中第一个非零数字的位置，以此构建新的整数字符串
    var offset = 0
    while offset < newLength && stack[offset] == 0 {
        offset += 1
    }
    
    return offset == newLength ? "0" : arrayzhuangString(ary: stack)
}


private func arrayzhuangString(ary: [Int]) -> String {
    
    let dataStr = ary.map(String.init)
    return dataStr.joined(separator: ",")
}
