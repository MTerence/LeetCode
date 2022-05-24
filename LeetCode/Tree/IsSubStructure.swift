//
//  IsSubStructure.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/16.
//

/*
 剑指 Offer 26. 树的子结构
 输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)
 B是A的子结构， 即 A中有出现和B相同的结构和节点值。
 
 例如:
 给定的树 A:

      3
     / \
    4   5
   / \
  1   2
 给定的树 B：

    4
   /
  1
 返回 true，因为 B 与 A 的一个子树拥有相同的结构和节点值。

 示例 1：
 输入：A = [1,2,3], B = [3,1]
 输出：false
 示例 2：
 输入：A = [3,4,5,1,2], B = [4,1]
 输出：true
 
 https://leetcode.cn/problems/shu-de-zi-jie-gou-lcof/
 */

import Cocoa

class IsSubStructure: NSObject {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil || B == nil { return false }
        if isEqual(A, B) { return true }
        if isSubStructure(A!.left, B) { return true }
        if isSubStructure(A!.right, B) { return true }
        return false
    }
    
    func isEqual(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil { return true }
        if A == nil { return false }
        if A!.val != B!.val { return false }
        
        return isEqual(A!.left, B!.left) && isEqual(A!.right, B!.right)
    }
}

