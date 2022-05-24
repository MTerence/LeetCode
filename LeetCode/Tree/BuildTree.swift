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
