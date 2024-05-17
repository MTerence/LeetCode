//
//  BuildTree.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/24.
//

/*
 剑指 Offer 07. 重建二叉树
 输入某二叉树的前序遍历和中序遍历的结果，请构建该二叉树并返回其根节点。
 假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

 示例 1:
 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 示例 2:
 Input: preorder = [-1], inorder = [-1]
 Output: [-1]

 限制：
 0 <= 节点个数 <= 5000
 注意：本题与主站 105 题重复：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
 https://leetcode.cn/problems/zhong-jian-er-cha-shu-lcof/
 */
import Cocoa

class BuildTree: NSObject {
    
    
    // 递归
    //         preLeft preLeft+1+(pIndex-1-inLeft) = preLeft+pIndex-inLeft
    //preorder root     [ left ]    [ right ]
    //inorder  [ left ]     root    [ right ]
    //         inLeft    pIndex     inRight
    //https://leetcode.cn/problems/zhong-jian-er-cha-shu-lcof/solution/jian-zhi-07-zhong-jian-er-cha-shu-by-tangweiqun/
    var inorderMap: [Int: Int] = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (index, value) in inorder.enumerated() {
            inorderMap[value] = index
        }
        return buildTree(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }
    
    func buildTree(_ preorder: [Int], _ preLeft: Int, _ preRight: Int, _ inorder: [Int], _ inLeft: Int, _ inRight: Int) -> TreeNode? {
        if preLeft > preRight || inLeft > inRight {
            return nil
        }
        let root = TreeNode(preorder[preLeft], left: nil, right: nil)
        guard let pIndex = inorderMap[root.val] else { return nil }
        root.left = buildTree(preorder, preLeft + 1, preLeft + pIndex - inLeft, inorder, inLeft, pIndex - 1)
        root.right = buildTree(preorder, preLeft + pIndex - inLeft + 1, preRight, inorder, pIndex + 1, inRight)
        return root
    }
}

/*
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。





             3

          /     \

         5       1

        / \     / \

       6   2   0   8

          /  \

          7   4



 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1

 输出：3

 解释：节点 5 和节点 1 的最近公共祖先是节点 3 。







 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4

 输出：5

 解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。


 
 class TreeNode {
     public left: TreeNode?
     public right: TreeNode?
     public val: Int?
     init(val: Int, left: TreeNode?, right: TreeNode?) {
         val = val
         left = left
         right = right
     }
 }

 func searchRoot(_ rootList: [TreeNode]?, treeA: TreeNode, treeB: TreeNode) -> TreeNode? {
     guard let root = root else { return nil }
     let left = searchRoot(root.left, treeA, TreeB)
     let right = searchRoot(root.right, treeA, TreeB)
     
     if left == nil && right == nil {
         return root
     }
     if left == nil {
         return right
     }
      if right == nil {
         return left
     }
     return nil
 }

 func buildTree(_ rootList: [Int]?) -> TreeNode? {
     guard var rootList = rootList, !rootList.isEmpty else { return }
     var root: TreeNode?
     var preLeft: TreeNode?
     var preRight: TreeNode?
     while rootList.isEmpty {
         let currentRoot = TreeNode(val: rootList.removeFirst())
         if (root == nil) {
             root = currentRoot
         }
         if preLeft {
             preLeft.left = currentRoot
         } else {
             preRight.left = currentRoot
         }
         if let val = rootList.removeFirst() {
             let left = TreeNode(val: val)
             currentRoot.left = left
             preLeft = left
         }
         if let val = rootList.removeFirst() {
             let right = TreeNode(val: val)
             currentRoot.right = right
             preRight = right
         }
     }
     return root
 }
 */
