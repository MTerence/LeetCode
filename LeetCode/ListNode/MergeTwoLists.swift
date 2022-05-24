//
//  MergeTwoLists.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/24.
//
/*
 21. 合并两个有序链表
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例 1：
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 https://leetcode-cn.com/problems/merge-two-sorted-lists/
 */
import Cocoa

class MergeTwoLists: NSObject {
    override init() {
        super.init()
        
        //l1 = [1,2,4], l2 = [1,3,4]
        let node1 = ListNode(4)
        let node2 = ListNode(2, node1)
        let node3 = ListNode(1, node2)
        
        let node4 = ListNode(4)
        let node5 = ListNode(3, node4)
        let node6 = ListNode(1, node5)
        
        let merged = mergeTwoLists1(node3, node6)
        print("")
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        var l1 = list1, l2 = list2
        let pre = ListNode()
        var cur = pre
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                cur.next = l1
                l1 = l1?.next
            } else {
                cur.next = l2
                l2 = l2?.next
            }
            cur = cur.next!
        }
        
        if l1 != nil {
            cur.next = l1
        }
        
        if l2 != nil {
            cur.next = l2
        }
        
        return pre.next
    }
    
    func mergeTwoLists1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        
        if list1!.val < list2!.val {
            list1?.next = mergeTwoLists1(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists1(list1, list2?.next)
            return list2
        }
    }
    
    func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        
        if list1!.val < list2!.val {
            list1?.next = mergeTwoLists2(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists2(list1, list2?.next)
            return list2
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
