//
//  Fatten.swift
//  LeetCode
//
//  Created by 马超 on 2024/6/5.
//
/*
 114. 二叉树展开为链表 中等
 给你二叉树的根结点 root ，请你将它展开为一个单链表：
 展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
 展开后的单链表应该与二叉树 先序遍历 顺序相同。
  

 示例 1：
 输入：root = [1,2,5,3,4,null,6]
 输出：[1,null,2,null,3,null,4,null,5,null,6]
 示例 2：
 输入：root = []
 输出：[]
 示例 3：
 输入：root = [0]
 输出：[0]
 https://leetcode.cn/problems/flatten-binary-tree-to-linked-list/description/
 */
import Cocoa

class Fatten: NSObject {
    // 递归
    var prevNode: TreeNode? = nil
    func flatten(_ root: TreeNode?) {
        if root == nil { return }
        flatten(root?.left)
        flatten(root?.right)
        root?.right = prevNode
        root?.left = nil
        prevNode = root
    }
    
    // 迭代 https://leetcode.cn/problems/flatten-binary-tree-to-linked-list/solutions/1218288/gryffindor-114-er-cha-shu-zhan-kai-wei-l-m0xf/
    func flatten1(_ root: TreeNode?) {
        var root = root
        while root != nil {
            // 左子树为null，直接考虑下个结点
            if root?.left == nil {
                root = root?.right
            } else {
                // 找左子树最右边的结点
                var node = root?.left
                while node?.right != nil {
                    node = node?.right
                }
                // 将原来的右子树接到左子树的最右边结点
                node?.right = root?.right
                root?.right = root?.left
                root?.left = nil
                // 继续下个结点
                root = root?.right
            }
        }
    }
}
