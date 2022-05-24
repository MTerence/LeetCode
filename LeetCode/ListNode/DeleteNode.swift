//
//  DeleteNode.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/2.
//
/*
 237. 删除链表中的节点
 请编写一个函数，用于 删除单链表中某个特定节点 。在设计函数时需要注意，你无法访问链表的头节点 head ，只能直接访问 要被删除的节点 。
 题目数据保证需要删除的节点 不是末尾节点 。

 示例 1：
 输入：head = [4,5,1,9], node = 5
 输出：[4,1,9]
 解释：指定链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9
 示例 2：
 输入：head = [4,5,1,9], node = 1
 输出：[4,5,9]
 解释：指定链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9
 https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
 */
import Cocoa

class DeleteNode: NSObject {
    func deleteNode(_ node: ListNode?) {
        node!.val = node!.next!.val
        node?.next = node?.next?.next
    }
    
    
    /*
     给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。

     返回删除后的链表的头节点。

     注意：此题对比原题有改动

     示例 1:

     输入: head = [4,5,1,9], val = 5
     输出: [4,1,9]
     解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
     示例 2:

     输入: head = [4,5,1,9], val = 1
     输出: [4,5,9]
     解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
     链接：https://leetcode.cn/problems/shan-chu-lian-biao-de-jie-dian-lcof
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        let pre = ListNode(0, head)
        var cur: ListNode? = pre
        while cur != nil {
            if let next = cur?.next,
               next.val == val {
                cur?.next = cur?.next?.next
                break
            }
            cur = cur?.next
        }
        
        return pre.next
    }
}
