//
//  ViewController.swift
//  算法
//
//  Created by iOS-UI on 2019/5/10.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

/*
    字典序算法！！！
 https://www.cnblogs.com/darklights/p/5285598.html
 
 */

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let dogBreeds = LineList<String>()
//        dogBreeds.appendLineList(value: "Labrador")
//        dogBreeds.appendLineList(value: "Bulldog")
//        dogBreeds.appendLineList(value: "Beagle")
//        dogBreeds.appendLineList(value: "Husky")
//        print(dogBreeds)
//        let aaa: Node = dogBreeds.removeNode(index: 0)!
//        print(aaa.value)
//        print(dogBreeds)
//
//        let numbers = LineList<Int>()
//        numbers.appendLineList(value: 5)
//        numbers.appendLineList(value: 10)
//        numbers.appendLineList(value: 15)
//        numbers.appendLineList(value: 12)
//        numbers.appendLineList(value: 15)
//        print(numbers)
//        let bbb: Node = numbers.cheakNodeAt(index: 1)!
//        print(bbb.value)
//        print(numbers)
        
        /*
        var arcNum = arc4random_uniform(uint(exactly: 10000)!)
        var numTotal = [Int]()
        
        while (arcNum > 0) {
            numTotal.append(Int(arc4random_uniform(uint(exactly: 1000000)!)))
            arcNum -= 1
        }
        print(numTotal.count ,numTotal)
        
        _ = BubbleSortOne(numTotal)
        _ = BubbleSortSecond(numTotal)
        _ = BubbleSortThird(numTotal)
        
        let e = BubbleSortUpgradedVersion([2, 3, 4, 5, 67, 50, 1])
        print(e)
         
        
        let a = sort(items: [2, 3, 4, 5, 67, 50, 1])
        print(a)
        
        let v = sortUnilateralCycle(items: [2, 3, 4, 5, 67, 50, 1])
        print(v)
 
        
        let b = heapSort(ary: [1,2,3,444,21,3342,65,7])
        print(b)
        
        let sss = countSort(ary: [1,2,3,4,4,7,3])
        print(sss)
        */


        /*
        let node1 = ListNode(133)
        let node2 = ListNode(90)
        let node3 = ListNode(11)
        let node4 = ListNode(12)
        let node5 = ListNode(12122)

        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node2

        let bo = hasCycle(node1)
        print(bo)
         *
        
        let aq = MinStack()
        aq.push(2)
        aq.push(3)
        aq.push(222)
        aq.push(1)
        print(aq.getMin(), aq.top())
        
        aq.pop()
        aq.pop()
        print(aq.getMin())
 
        print(getterGreatestCommonDivisor(a: 2, b: 9))
 
        print( getterMaxSortedDistance(array: [2,3,4,5,10]))
        
        let aaaaa = QueueSort()
        aaaaa.pushStack(value: 90)
        aaaaa.pushStack(value: 11)
        aaaaa.pushStack(value: 15)
        aaaaa.pushStack(value: 12)
        aaaaa.pushStack(value: 13)
        print(aaaaa.peekStack()!)
         
         
         print(findNearestNumber(numbers: [1,4,43,2,66]))
         */
        
        print(removeKDigits(numStr: "12364", k: 3))
        
    }
}


/// MARK: ------↓------↓--- 链表 ---↓------↓------

/// 链表节点数据
class Node<T> {
    
    var value: T //数据
    var next: Node? //下一个节点
    weak var previous: Node? // 双向列表的上一个节点
    
    init(value: T) {
        self.value = value
    }
}

// 链表
class LineList<T> {
    
    /// 链表头
    private var head: Node<T>?
    /// 链表尾
    private var tail: Node<T>?
    
    
    /// 添加链表
    ///
    /// - Parameter value: 链表值
    func appendLineList(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }else {
            head = newNode
        }
        tail = newNode
    }
    
    
    /// 查询第几个链表参数
    ///
    /// - Parameter index: 下标
    /// - Returns: 返回链表参数
    func cheakNodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var nodeTemp = head
            var i = index
            while nodeTemp != nil {
                if i == 0 { return nodeTemp! }
                i -= 1
                nodeTemp = nodeTemp?.next
            }
        }
        return nil
    }
    
    /// 全部删除
    func removeLinkList() {
        head = nil
        tail = nil
    }
    
    /// 删除指定位置
    func removeNode(index: Int) -> Node<T>? {
        let removeNode: Node<T>?
        
        let prevNode = cheakNodeAt(index: index)
        let nextNode = prevNode?.next?.next
        
        removeNode = prevNode?.next
        prevNode?.next = nextNode
        
        return removeNode
    }
}

extension LineList: CustomStringConvertible {
    
    public var description: String {
        
        var text = ""
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += " -> " }
        }
        return text
    }
}



/// MARK: ------↑------↑--- 链表 ---↑------↑------


/// MARK: ------↓------↓--- 判断链表 是否有环！！！ ---↓------↓------
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func hasCycle(_ head: ListNode?) -> String {
    
    var slow = head
    var fast = head
    
    while fast != nil && fast!.next != nil {
        
        slow = slow!.next
        fast = fast!.next!.next
        
        if slow === fast {
            return "有环"
        }
    }
    return "无环"
}
/// MARK: ------↑------↑--- 判断链表 是否有环！！！ ---↑------↑------





/// MARK:≈ 判断一个数是否为2的整数次幂
func isPowerOf2(num: Int) -> Bool {
    
    return (num & num - 1) == 0
}

