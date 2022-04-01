//
//  PostorderTraversal.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/1.
//
/*
 145. 二叉树的后序遍历
 给你一棵二叉树的根节点 root ，返回其节点值的 后序遍历 。

 示例 1：
 输入：root = [1,null,2,3]
 输出：[3,2,1]
 https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
 */
import Cocoa

//left - right - root
class PostorderTraversal: NSObject {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        postor(root, &res)
        return res
    }
    
    func postor(_ node: TreeNode?, _ res: inout [Int]) {
        if node == nil { return }
        postor(node!.left, &res)
        postor(node!.right, &res)
        res.append(node!.val)
    }
}
