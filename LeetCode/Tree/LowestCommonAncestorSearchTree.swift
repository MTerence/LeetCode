//
//  LowestCommonAncestorSearchTree.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/3.
//

/*
 235. 二叉搜索树的最近公共祖先
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]
 示例 1:
 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 输出: 6
 解释: 节点 2 和节点 8 的最近公共祖先是 6。
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 */
import Cocoa

class LowestCommonAncestorSearchTree: NSObject {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        
        var cur = root
        while cur != nil {
            if cur!.val == p!.val || cur!.val == q!.val {
                return cur
            } else if cur!.val > p!.val && cur!.val < q!.val {
                return cur
            } else if cur!.val < p!.val && cur!.val > q!.val {
                return cur
            } else if cur!.val > p!.val && cur!.val > q!.val {
                cur = cur!.left
            } else {
                cur = cur?.right
            }
        }
        return cur
    }
    
    func lowestCommonAncestor1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        //1. p和q在root两侧
        if (p!.val < root!.val && q!.val > root!.val)
            || (p!.val > root!.val && q!.val < root!.val) {
            return root
        }
        
        //2. p或者q = root
        if p!.val == root!.val || q!.val == root!.val{
            return root
        }
        
        if p!.val < root!.val && q!.val < root!.val {
           return lowestCommonAncestor1(root!.left, p, q)
        }
        
        if p!.val > root!.val && q!.val > root!.val {
           return lowestCommonAncestor1(root?.right, p, q)
        }
        return nil
    }
}
