//
//  IsSymmetric.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/2.
//
/*
 101. 对称二叉树
 给你一个二叉树的根节点 root ， 检查它是否轴对称。


 示例 1：
 输入：root = [1,2,2,3,4,4,3]
 输出：true
 https://leetcode-cn.com/problems/symmetric-tree/
 */
import Cocoa

class IsSymmetric: NSObject {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirro(root, root)
    }
    
    func isMirro(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil { return true }
        if node1 == nil || node2 == nil { return false }
        if node1!.val != node2!.val { return false }
        return isMirro(node1!.left, node2!.right) && isMirro(node1!.right, node2!.left)
    }
}

