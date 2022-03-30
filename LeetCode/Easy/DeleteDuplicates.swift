//
//  DeleteDuplicates.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//
/*
 83. 删除排序链表中的重复元素
 给定一个已排序的链表的头 head ， 删除所有重复的元素，使每个元素只出现一次 。返回 已排序的链表 。
 示例 1：
 输入：head = [1,1,2]
 输出：[1,2]
 
 示例 2：
 输入：head = [1,1,2,3,3]
 输出：[1,2,3]
 https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
 */
import Cocoa

class DeleteDuplicates: NSObject {
    override init() {
        super.init()
        //[1,1,2,3,3]
        let node1 = ListNode(3)
        let node2 = ListNode(3, node1)
        let node3 = ListNode(2, node2)
        let node4 = ListNode(1, node3)
        let node5 = ListNode(1, node4)
        let deleteDuplicates = deleteDuplicates(node5)
        print("\(deleteDuplicates?.val)")
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }
        var cur = head
        while cur?.next != nil {
            if cur!.val == cur!.next!.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return head
    }
    
    //哈希集合
    func deleteDuplicates1(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        var set: Set<Int> = Set()
        var cur = head
        while cur!.next != nil {
            if set.contains(cur!.next!.val){
                cur?.next = cur!.next!.next
            } else {
                set.insert((cur!.next?.val)!)
                cur = cur?.next
            }
        }
        return set.contains(head!.val) ? head?.next : head
    }
}
