//
//  Test.swift
//  LeetCode
//
//  Created by 马超 on 2025/2/26.
//

import Cocoa

/*
 给定一个已排序的链表的头 head，删除原始链表中所有重复数字的节点，只留下不同的数字，返回新链表
  
 输入：head = [1,2,3,3,3,4,5]
 输出：[1,2,5]
 */

class Test: NSObject {
    
    override init() {
        super.init()
        var node1 = ListNode(1)
        var node2 = ListNode(2)
        var node3 = ListNode(3)
        var node4 = ListNode(3)
        var node5 = ListNode(4)
        var node6 = ListNode(4)
        var node7 = ListNode(5)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node6
        node6.next = node7
        
        
        let res = self.deleteNode(head: node1)
        print("------")
        
        var array = [3, 2, 4, 1]
        self.sortArray(nums: &array)
        print("-------sortArray", array)
    }
    
    func deleteNode(head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var cur = head
        while cur?.next != nil, cur?.next?.next != nil {
            var nextNode = cur?.next
            while nextNode?.val == nextNode?.next?.val {
                nextNode = nextNode?.next
            }
            
//            if cur?.next?.val == cur?.next?.next?.val {
//                cur?.next = cur?.next?.next?.next
//            }
            cur = nextNode?.next
        }
        return head
    }
    
    func sortArray(nums: inout [Int]){
        for (indexI, numI) in nums.enumerated() {
            for indexJ in indexI+1..<nums.count{
                let numJ = nums[indexJ]
                if numI > numJ {
                    nums[indexI] = numJ
                    nums[indexJ] = numI
                }
            }
        }
    }
}
