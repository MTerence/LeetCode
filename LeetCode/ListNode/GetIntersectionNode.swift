//
//  GetIntersectionNode.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/16.
//

/*
 剑指 Offer 52. 两个链表的第一个公共节点
 输入两个链表，找出它们的第一个公共节点。

 如下面的两个链表：
 在节点 c1 开始相交。

 示例 1：
 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
 输出：Reference of the node with value = 8
 输入解释：相交节点的值为 8 （注意，如果两个列表相交则不能为 0）。从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,0,1,8,4,5]。在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
  

 示例 2：
 输入：intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
 输出：Reference of the node with value = 2
 输入解释：相交节点的值为 2 （注意，如果两个列表相交则不能为 0）。从各自的表头开始算起，链表 A 为 [0,9,1,2,4]，链表 B 为 [3,2,4]。在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。
  

 示例 3：
 输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
 输出：null
 输入解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
 解释：这两个链表不相交，因此返回 null。
 https://leetcode.cn/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/
 */
import Cocoa

class GetIntersectionNode: NSObject {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var set = Set<ListNode>()
        var currentA = headA
        while currentA != nil {
            set.insert(currentA!)
            currentA = currentA!.next
        }
        
        var currentB = headB
        while currentB != nil {
            if set.contains(currentB!) {
                return currentB
            }
            currentB = currentB!.next
        }
        return nil
    }
    
    /*
     2. 双指针
     这里需要的是数学证明了，因为首尾相接，所以他们每一次轮回的路程相等，既 A+B=B+A。

     1. 不管 相不相交， 当 currentA拼接B的时候，currentB拼接A的时候，他们能同时走到对方的尾节点，如果不相交，此时都为空，跳出循环
     2. 如果相交，那么我们逆推，既然能在尾节点相遇，那么尾节点的前继节点也是相遇，直到我们逆推到第一个相交点。
     */
    func getIntersectionNode1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var currentA = headA
        var currentB = headB
        while currentA != currentB {
            currentA = currentA == nil ? headB : currentA?.next
            currentB = currentB == nil ? headA : currentB?.next
        }
        
        return currentA
    }
}
