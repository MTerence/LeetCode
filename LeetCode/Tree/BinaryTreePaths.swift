//
//  BinaryTreePaths.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/19.
//
/*
 257. 二叉树的所有路径 简单
 给你一个二叉树的根节点 root ，按 任意顺序 ，返回所有从根节点到叶子节点的路径。
 叶子节点 是指没有子节点的节点。

 示例 1：
 输入：root = [1,2,3,null,5]
 输出：["1->2->5","1->3"]
 示例 2：
 输入：root = [1]
 输出：["1"]
 https://leetcode.cn/problems/binary-tree-paths/description/
 */

import Cocoa

class BinaryTreePaths: NSObject {
    /*  直接递归
     https://leetcode.cn/problems/binary-tree-paths/solutions/1194370/257-er-cha-shu-de-suo-you-lu-jing-by-hzy-ojq2/
     */
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        if root.left == nil && root.right == nil {
            return [String(root.val)]
        }
        let leftPaths = binaryTreePaths(root.left)
        let rightPaths = binaryTreePaths(root.right)
        var ans: [String] = []
        for path in leftPaths {
            ans.append(String(root.val) + "->" + path)
        }
        for path in rightPaths {
            ans.append(String(root.val) + "->" + path)
        }
        return ans
    }
}
