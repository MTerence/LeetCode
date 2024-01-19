//
//  ListNode.swift
//  LeetCode
//
//  Created by Ternence on 2021/10/11.
//

import Foundation

class ListNode: NSObject {
    //数据域
    var val: Int
    //指针域
    var next:ListNode?
    
    override init() {
        self.val = 0
        self.next = nil
    }
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

/*
extension ListNode: Hashable, Equatable {
   public func hash(into hasher: inout Hasher) {
     // 用于唯一标识
     hasher.combine(val)
     hasher.combine(ObjectIdentifier(self))
   }

   public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
     return lhs === rhs
   }
}
*/
