//
//  ReversePrint.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/24.
//

/*
 剑指 Offer 06. 从尾到头打印链表
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。
 示例 1：
 输入：head = [1,3,2]
 输出：[2,3,1]

 限制：
 0 <= 链表长度 <= 10000
 https://leetcode.cn/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
 */
import Cocoa

class ReversePrint: NSObject {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var array: [Int] = []
        var current = head
        while current != nil {
            array.insert(current!.val, at: 0)
            current = current?.next
        }
        return array
    }
}
