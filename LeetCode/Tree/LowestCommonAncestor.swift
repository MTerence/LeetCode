//
//  LowestCommonAncestor.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/3.
//

/*
 236. 二叉树的最近公共祖先
 中等
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 
 示例 1：
 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出：3
 解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
 示例 2：
 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出：5
 解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。
 示例 3：
 输入：root = [1,2], p = 1, q = 2
 输出：1
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 */
import Cocoa

class LowestCommonAncestor: NSObject {
    
    //https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-tree/solution/java-di-gui-qing-xi-hao-dong-dai-ma-8xing-by-ventu/
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        if root!.val == p!.val || root!.val == q!.val { return root }
        
        let left  = lowestCommonAncestor(root!.left, p, q)
        let right = lowestCommonAncestor(root!.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        
        if left == nil { return right }
        
        if right == nil { return left }
        
        return nil
    }
}
