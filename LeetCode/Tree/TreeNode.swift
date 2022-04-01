//
//  TreeNode.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//

import Cocoa

class TreeNode: NSObject {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    override init() {
        self.val    = 0
        self.left   = nil
        self.right  = nil
    }
    init(_ val: Int, left: TreeNode?, right: TreeNode?) {
        self.val    = val
        self.left   = left
        self.right  = right
    }
}
