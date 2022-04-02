//
//  IsSameTree.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/2.
//
/*
 100. 相同的树
 给你两棵二叉树的根节点 p 和 q ，编写一个函数来检验这两棵树是否相同。
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。


 示例 1：
 输入：p = [1,2,3], q = [1,2,3]
 输出：true
 示例 2：
 输入：p = [1,2], q = [1,null,2]
 输出：false
 示例 3：
 输入：p = [1,2,1], q = [1,1,2]
 输出：false
 https://leetcode-cn.com/problems/same-tree/
 */
import Cocoa

class IsSameTree: NSObject {
    // 1. 优先深度搜索
    // 如果两棵二叉树都未空，则二叉树相同
    // 如果两棵二叉树中只有一课为空，则二叉树不相同
    // 如果两个二叉树都不为空，但根节点的值不相同，则二叉树不同
    // 如果两棵二叉树的左子树和右子树相同，则是相同的二叉树
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil & q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        } else if p!.val != q!.val {
            return false
        } else {
            return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
        }
    }
}
