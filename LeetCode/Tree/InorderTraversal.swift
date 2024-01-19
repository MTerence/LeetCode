//
//  InorderTraversal.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//

/*
 94. 二叉树的中序遍历
 给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。

 示例 1：
 输入：root = [1,null,2,3]
 输出：[1,3,2]
 示例 2：
 输入：root = []
 输出：[]
 
 示例 3：
 输入：root = [1]
 输出：[1]
 https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
 */
import Cocoa
// 左-中-右
class InorderTraversal: NSObject {
    //1. 迭代解法
    /*
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        if root == nil { return res }
        
        var stack = ArrayStack<Int>(Int.max)
        if cur.left != nil {
            stack.push(cur!.left)
        }
        
        while !stack.isEmpty {
            let cur = stack.pop()
            res.append(cur.left)
            if cur.left != nil {
                stack.push(cur!.left)
            }
            
            stack.push(root)
            
            if cur.right != nil {
                stack.push(cur!.right)
            }
            
        }
        return res
    }
    */
    
    //2. 递归解法
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        inorder(root, &res)
        return res
    }
    
    func inorder(_ node: TreeNode?, _ res: inout [Int]) {
        if node == nil { return }
        inorder(node?.left, &res)
        res.append(node!.val)
        inorder(node?.right, &res)
    }
}

extension InorderTraversal {
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res: [Int] = []
        inorder1(root, &res)
        return res
    }
    
    func inorder1(_ treeNode: TreeNode?, _ res: inout [Int]) {
        guard let treeNode = treeNode else { return }
        inorder1(treeNode.left, &res)
        res.append(treeNode.val)
        inorder1(treeNode.right, &res)
    }
}
