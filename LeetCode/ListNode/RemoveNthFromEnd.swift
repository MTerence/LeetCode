//
//  RemoveNthFromEnd.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/24.
//

/*
 19. 删除链表的倒数第 N 个结点
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 示例 1：
 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 */

import Cocoa

class RemoveNthFromEnd: NSObject {
    override init() {
        super.init()
        
        //[1,2,3,4,5]
        let node1 = ListNode(5)
        let node2 = ListNode(4, node1)
        let node3 = ListNode(3, node2)
        let node4 = ListNode(2, node3)
        let node5 = ListNode(1, node4)
        
        let removed = removeNthFromEnd1(node5, 2)
        print("")
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let length = getLength(head)
        let pre = ListNode(0, head)
        var cur: ListNode? = pre
        for _ in 0..<length - n {
            cur = cur?.next
        }
        cur?.next = cur?.next?.next
        return pre.next
    }
    
    func getLength(_ head: ListNode?) -> Int {
        var length = 0
        var cur = head
        while cur != nil {
            length += 1
            cur = cur?.next
        }
        return length
    }
    
    // 先后指针法
    func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyNode = ListNode(0, head)
        var slow: ListNode? = dummyNode
        var fast: ListNode? = dummyNode
        
        for _ in 0...n {
            fast = fast?.next
        }
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        slow?.next = slow?.next?.next
        return dummyNode.next

    }
    
    // 1 2 3 4 5
    // 2
    func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {

        let length = getLength1(head)
        let pre = ListNode(0, head)
        var cur: ListNode? = pre
        for _ in 0..<length-n {
            cur = cur?.next
        }
        cur?.next = cur?.next?.next
        return pre
        
    }
    
    func getLength1(_ head: ListNode?) -> Int {
        var cur = head
        var count: Int = 0
        while cur != nil {
            cur = cur!.next
            count += 1
        }
        return count
    }
}
