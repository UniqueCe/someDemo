//
//  MinStack.swift
//  算法
//
//  Created by iOS-UI on 2019/5/20.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

class MinStack {
    
    private var stackTop: Int?
    
    /// 栈队
    private var stack: [Int]
    
    /// 最小栈队
    private var stackMin: [Int]
    
    init() {
        stack = [Int]()
        stackTop = nil
        stackMin = [Int]()
    }
    
    
    /// 入栈
    func push(_ x: Int) {
        
        stackTop = x
        stack.append(x)
        
        /// 获取最小栈，保存到stackMin 数组
        if stackMin.isEmpty {
            
            stackMin.append(x)
        } else if x <= stackMin.last! {
            
            stackMin.append(x)
        }
    }
    
    /// 出栈
    func pop() {
        
        let top = stack.removeLast()
        
        if top == stackMin.last! {
            
            stackMin.removeLast()
        }
        stackTop = stack.last
    }
    
    /// 栈顶
    func top() -> Int {
        return stackTop!
    }
    
    /// 最小栈
    func getMin() -> Int {
        return stackMin.last!
    }
}
