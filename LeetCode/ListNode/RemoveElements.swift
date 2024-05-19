//
//  RemoveElements.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/19.
//
/*
 203. 移除链表元素 简单
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
  
 示例 1：
 输入：head = [1,2,6,3,4,5,6], val = 6
 输出：[1,2,3,4,5]
 示例 2：

 输入：head = [], val = 1
 输出：[]
 示例 3：

 输入：head = [7,7,7,7], val = 7
 输出：[]
 https://leetcode.cn/problems/remove-linked-list-elements/description/
 */
import Cocoa

class RemoveElements: NSObject {
    //[1,2,6,3,4,5,6] 6
    // 迭代法
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else { return nil }
        var dummyHead = ListNode()
        dummyHead.next = head
        var cur = dummyHead
        while cur.next != nil {
            if cur.next?.val == val {
                cur.next = cur.next?.next
            } else {
                cur = cur.next!
            }
        }
        return dummyHead.next
    }
    
    // 递归
    /*
     链表的定义具有递归的性质，因此链表题目常可以用递归的方法求解。这道题要求删除链表中所有节点值等于特定值的节点，可以用递归实现。
     对于给定的链表，首先对除了头节点 head 以外的节点进行删除操作，然后判断 head 的节点值是否等于给定的 val。如果 head 的节点值等于 val，则 head 需要被删除，因此删除操作后的头节点为 head.next；如果 head 的节点值不等于 val，则 head 保留，因此删除操作后的头节点还是 head。上述过程是一个递归的过程。

     递归的终止条件是 head 为空，此时直接返回 head。当 head 不为空时，递归地进行删除操作，然后判断 head 的节点值是否等于 val 并决定是否要删除 head
     https://leetcode.cn/problems/remove-linked-list-elements/solutions/813358/yi-chu-lian-biao-yuan-su-by-leetcode-sol-654m/
     */
    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else { return nil }
        head.next = removeElements2(head.next, val)
        return head.val == val ? head.next : head
    }
}
