//
//  TreeNode.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//
/*
 平衡二叉树：是指该树所有节点的左右子树的深度相差不超过 1。
 
 二叉搜索树：它或者是一棵空树，或者是具有下列性质的二叉树： 若它的左子树不空，则左子树上所有结点的值均小于它的根结点的值； 若它的右子树不空，则右子树上所有结点的值均大于它的根结点的值,它的左、右子树也分别为二叉搜索树
 */

import Cocoa

class TreeNode: NSObject {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    override init() {
        self.val    = 0
        self.left   = nil
        self.right  = nil
    }
    init(_ val: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.val    = val
        self.left   = left
        self.right  = right
    }
}
