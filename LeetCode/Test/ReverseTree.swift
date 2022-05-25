//
//  ReverseTree.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/25.
//

/*
 字节-星图一面 翻转一棵树
 */
import Cocoa

class ReverseTree: NSObject {
    func reverseTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let left = reverseTree(root.left)
        let right = reverseTree(root.right)
        root.left = right
        root.right = left
        return root
    }
}
