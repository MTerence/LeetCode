//
//  ListNode.swift
//  LeetCode
//
//  Created by Ternence on 2021/10/11.
//

import Foundation

class ListNode {
    //数据域
    var val: Int
    //指针域
    var next:ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
