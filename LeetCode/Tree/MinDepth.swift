//
//  MinDepth.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/19.
//
/*
 111. 二叉树的最小深度 简单
 给定一个二叉树，找出其最小深度。
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 说明：叶子节点是指没有子节点的节点。

 示例 1：
 输入：root = [3,9,20,null,null,15,7]
 输出：2
 示例 2：
 输入：root = [2,null,3,null,4,null,5,null,6]
 输出：5
 https://leetcode.cn/problems/minimum-depth-of-binary-tree/description/
 */
import Cocoa

class MinDepth: NSObject {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        // 左子树右子树都为空
        if root.left == nil && root.right == nil {
            return 1
        }
        let m1 = minDepth(root.left)
        let m2 = minDepth(root.right)
        // 左右子树有一个为空
        if root.left == nil || root.right == nil {
            return m1 + m2 + 1
        }
        // 左右子树都不为空，返回最小深度
        return min(m1, m2) + 1
    }
}
