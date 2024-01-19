//
//  HasCycle.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/24.
//

/*
 141. 环形链表
 给你一个链表的头节点 head ，判断链表中是否有环。
 https://leetcode-cn.com/problems/linked-list-cycle/
 */
import Cocoa

class HasCycle: NSObject {
    
    override init() {
        super.init()
        
        //5 4 3 2 1
        let node1 = ListNode(1)
        let node2 = ListNode(2, node1)
        let node3 = ListNode(3, node2)
        let node4 = ListNode(4, node3)
        let node5 = ListNode(5, node4)
        
        
        let hasCycleResult1 = hasCycle1(node5)
        node1.next = node3
        let hasCycleResult2 = hasCycle1(node5)
        print("hasCycle: \(hasCycleResult1) \(hasCycleResult2)")
    }
    
    
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                return true
            }
        }
        
        return false
    }
    
    func hasCycle1(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil || head?.next?.next == nil  {
            return false
        }
        
        var set: Set<ListNode> = Set()
        var cur = head
        while cur != nil {
            if set.contains(cur!) {
                return true
            }
            set.insert(cur!)
            cur = cur?.next
        }
        return false
    }
}
