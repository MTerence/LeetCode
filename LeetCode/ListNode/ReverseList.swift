//
//  ReverseList.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/23.
//

/*
 206. 反转链表
 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
  
 示例 1：
 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]
 示例 2：

 输入：head = [1,2]
 输出：[2,1]
 示例 3：

 输入：head = []
 输出：[]
 https://leetcode-cn.com/problems/reverse-linked-list/
 */
import Cocoa

class ReverseList: NSObject {
    override init() {
        super.init()
        
        //head = [1,2,3,4,5]
        let node1 = ListNode(5)
        let node2 = ListNode(4, node1)
        let node3 = ListNode(3, node2)
        let node4 = ListNode(2, node3)
        let node5 = ListNode(1, node4)
        let reversed = reverseList(node5)
        print("\(reversed)")
    }
    
    // 迭代法
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head

        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
    
    // 递归法
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let p = reverseList1(head?.next)
        head?.next?.next = head
        head?.next = nil
        return p
    }
    
    // 头插法
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let temp = ListNode()
        var head = head
        var next: ListNode? = nil
        while head != nil {
            next = head?.next
            head!.next = temp.next
            temp.next = head
            head = next
        }
        return temp.next
    }
 
}











extension ReverseList {
    //迭代吗
    func reverseList3(_ head: ListNode?) -> ListNode? {
        var cur = head
        var pre: ListNode? = nil
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
}
