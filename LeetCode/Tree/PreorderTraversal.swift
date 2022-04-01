//
//  PreorderTraversal.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/31.
//

/*
 144. 二叉树的前序遍历
 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
 
 输入：root = [1,null,2,3]
 输出：[1,2,3]
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
 */
import Cocoa

class PreorderTraversal: NSObject {
    // 先遍历root，再遍历左节点，再遍历右节点
    // 遍历法
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        if root == nil { return res }
        let stack = ArrayStack<TreeNode>.init(100)
        let _ = stack.push(root!)
        
        while !stack.isEmpty {
            let curr = stack.pop()
            res.append(curr!.val)
            
            if curr?.right != nil {
                let _ = stack.push(curr!.right!)
            }
            
            if curr?.left != nil {
                let _ = stack.push(curr!.left!)
            }
        }
        return res
     }
    
    //递归法
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        preorder(root, &res)
        return res
    }
    
    func preorder(_ treeNode: TreeNode?, _ res: inout [Int]) {
        if treeNode == nil { return }
        res.append(treeNode!.val)
        preorder(treeNode?.left, &res)
        preorder(treeNode?.right, &res)
    }
}
