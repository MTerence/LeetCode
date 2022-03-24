//
//  MiddleNode.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/24.
//
/*
 876. 链表的中间结点
 给定一个头结点为 head 的非空单链表，返回链表的中间结点。
 如果有两个中间结点，则返回第二个中间结点。

 示例 1：
 输入：[1,2,3,4,5]
 输出：此列表中的结点 3 (序列化形式：[3,4,5])
 返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
 注意，我们返回了一个 ListNode 类型的对象 ans，这样：
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
 示例 2：

 输入：[1,2,3,4,5,6]
 输出：此列表中的结点 4 (序列化形式：[4,5,6])
 由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。
 https://leetcode-cn.com/problems/middle-of-the-linked-list/
 */
import Cocoa

class MiddleNode: NSObject {
    override init() {
        super.init()
        
        //[1,2,3,4,5]
        let node0 = ListNode(6)
        let node1 = ListNode(5, nil)
        let node2 = ListNode(4, node1)
        let node3 = ListNode(3, node2)
        let node4 = ListNode(2, node3)
        let node5 = ListNode(1, node4)
        
        let middle = middleNode2(node5)
        print("")
    }
    
    //数组
    func middleNode(_ head: ListNode?) -> ListNode? {
        var array: [ListNode] = []
        var cur = head
        while cur != nil {
            array.append(cur!)
            cur = cur?.next
        }
        return array[array.count/2]
    }
    
    //单指针法
    func middleNode1(_ head: ListNode?) -> ListNode? {
        var cur = head
        var n = 0
        while cur != nil {
            n += 1
            cur = cur?.next
        }
        
        var k = 0
        cur = head
        while k < n / 2 {
            k += 1
            cur = cur?.next
        }
        return cur
    }
    
    
    func middleNode2(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while slow != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
