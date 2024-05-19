//
//  CountNodes.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/19.
//
/*
 222. 完全二叉树的节点个数
 给你一棵 完全二叉树 的根节点 root ，求出该树的节点个数。
 完全二叉树的定义如下：
    在完全二叉树中，除了最底层节点可能没填满外，其余每层节点数都达到最大值，并且最下面一层的节点都集中在该层最左边的若干位置。若最底层为第 h 层，则该层包含 1~ 2h 个节点。

 示例 1：
 输入：root = [1,2,3,4,5,6]
 输出：6
 示例 2：
 输入：root = []
 输出：0
 示例 3：
 输入：root = [1]
 输出：1
 https://leetcode.cn/problems/count-complete-tree-nodes/
 */
import Cocoa

class CountNodes: NSObject {
    // 暴力解法 按照普通二叉树去遍历
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = countNodes(root.left)
        let right = countNodes(root.right)
        return left + right + 1
    }
    
    // 利用完全二叉树性质
    /*
     https://leetcode.cn/problems/count-complete-tree-nodes/solutions/1812445/by-carlsun-2-bwlp/
     */
    func countNodes1(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var left = root.left
        var right = root.right
        var leftDepth = 0
        var rightDepth = 0
        
        // 求左子树深度
        while left != nil {
            left = left?.left
            leftDepth += 1
        }
        // 求右子树深度
        while right != nil {
            right = right?.right
            rightDepth += 1
        }
        
        // 根据左深度和右深度 是否相同判断该子树是不是满二叉树
        // 2 << 2 相当于2^2 ,返回满足满二叉树的子树结点数量
        if leftDepth == rightDepth {
            return (2 << leftDepth) - 1
        }
        return countNodes1(root.left) + countNodes1(root.right) + 1
    }
    
    
}
