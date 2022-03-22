//
//  List.swift
//  算法
//
//  Created by Ternence on 2021/5/6.
//

import Foundation

class List {
    var head: ListNode?
    var tail: ListNode?
    
    func appendToHead(_ val: Int) {
        if head == nil {
            //创建头节点
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            //把当前head地址赋值给temp的指针域
            temp.next = head
            head = temp
            
        }
    }
    
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
}
