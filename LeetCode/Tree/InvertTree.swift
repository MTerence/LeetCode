//
//  InvertTree.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/3.
//

/*
 226. 翻转二叉树
 给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。
 示例 1：
 输入：root = [4,2,7,1,3,6,9]
 输出：[4,7,2,9,6,3,1]
 https://leetcode-cn.com/problems/invert-binary-tree/
 */
import Cocoa

class InvertTree: NSObject {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return root }
        
        let left = invertTree(root!.left)
        let right = invertTree(root!.right)
        
        root!.left = right
        root!.right = left
        return root
    }
    
    func invertTree1(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        root.left = right
        root.right = left
        return root
    }
}
