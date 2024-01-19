//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/22.
//

/*
 2. 两数相加
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例 1：
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 */
import Cocoa

class AddTwoNumbers: NSObject {

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var ll1 = l1, ll2 = l2, cursor = ListNode()
        let result = cursor
        var flag = 0
        
        while ll1?.val != nil || ll2?.val != nil || flag == 1 {
            let val1 = ll1?.val ?? 0
            let val2 = ll2?.val ?? 0
            var sum = val1 + val2 + flag
            
            if sum > 9 {
                flag = 1
                sum = sum % 10
            } else {
                flag = 0
            }
            
            ll1 = l1?.next
            ll2 = l2?.next
            
            cursor.next = ListNode(sum)
            cursor = cursor.next!
        }
        
        return result.next
    }
    
    func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode {
        var cur = ListNode(0)
        var l1 = l1, l2 = l2
        var carry = 0
        
        while l1?.val != nil || l2?.val != nil {
            var value = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = 0
            if value > 10 {
                carry = 1
                value -= 10
            }
            
            cur.next = ListNode(value)
            cur = cur.next!
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        if carry != 0 {
            cur.next = ListNode(carry)
            cur = cur.next!
        }
        
        return cur.next!
    }
}

extension AddTwoNumbers {
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode {
        var head = ListNode(0)
        var cur = head
        var carry = 0
        var l1 = l1, l2 = l2
        while l1 != nil || l2 != nil {
            var value = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            if value > 9 {
                carry = 1
                value -= 10
            }
            l1 = l1?.next
            l2 = l2?.next
            
            cur.val = value
            cur = cur.next!
        }
        
        if carry > 0 {
            cur.next = ListNode(carry)
            cur = cur.next!
        }
        return head.next!
    }
}
