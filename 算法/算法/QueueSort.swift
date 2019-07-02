//
//  QueueSort.swift
//  算法
//
//  Created by iOS-UI on 2019/5/21.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation


class QueueSort: NSObject {
    
    /// 初始栈
    private var stackNew = [Int]()
    /// 倒序栈
    private var stackOld = [Int]()
    
    /// 入栈
    func pushStack(value: Int) {
        stackNew.append(value)
    }
    
    /// 出栈
    func peekStack() -> Int? {
        
        stackNewTransferStackOld()
        
        let val = stackOld.last
        
        if val != nil {
            
            stackOld.removeLast()
        }
        return val
    }

    /// stackNew 倒序 到 stackOld 用于出栈
    private func stackNewTransferStackOld() {
        
        if  stackOld.count == 0 {
            
            while stackNew.count > 0 {
                
                let val = stackNew.last!
                stackNew.removeLast()
                stackOld.append(val)
            }
        }
    }
}
