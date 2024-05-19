//
//  SortedArrayToBST.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/17.
//
/*
 108. 将有序数组转换为二叉搜索树
 给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 平衡 二叉搜索树。
 
 示例 1：
 输入：nums = [-10,-3,0,5,9]
 输出：[0,-3,9,-10,null,5]
 解释：[0,-10,5,null,-3,null,9] 也将被视为正确答案：

 示例 2：
 输入：nums = [1,3]
 输出：[3,1]
 解释：[1,null,3] 和 [3,1] 都是高度平衡二叉搜索树。
 https://leetcode.cn/problems/convert-sorted-array-to-binary-search-tree/description/

 二叉搜索树：
 它或者是一颗空树，或者是具有下列性质的二叉树：
 若它的左子树不空，则左子树上所有结点的值均小于它的根结点的值
 若它的右子树不空，则右子树上所有结点的值均大于它的根结点的值
 它的左、右子树也分别为二叉搜索树
 
 平衡二叉树：
 指一个二叉树左右子树的高度差绝对值不超过1
 
 中序遍历：
 left root right
 
 */
import Cocoa

class SortedArrayToBST: NSObject {
    // 中序+递归 https://leetcode.cn/problems/convert-sorted-array-to-binary-search-tree/solutions/312607/jiang-you-xu-shu-zu-zhuan-huan-wei-er-cha-sou-s-33/
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedToBST(nums, 0, nums.count - 1)
    }
    
    // 复杂度分析：三种方法的复杂度一样
    // 时间复杂度：O(n)，其中n是数组的长度,每个数字只访问一次
    // 空间复杂度: O(log n), 其中n是数组的长度，空间复杂度不考虑返回值，因此空间复杂度主要取决于递归栈的深度,递归栈的深度是O(log n)
    
    // 中序遍历，总是选择中间位置左边的数字做为根结点
    func sortedToBST(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        // 总是选择中间位置左边的数字做为根结点
        var middle = (left + right)/2
        let root = TreeNode(nums[middle])
        // 分割数组左边，递归生成左分支
        root.left = sortedToBST(nums, left, middle - 1)
        // 分割数组右边，递归生成右分支
        root.right = sortedToBST(nums, middle+1, right)
        return root
    }
    
    // 中序遍历，总是选择中间位置右边的数字做为根结点
    func sortedToBST1(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        guard left <= right else {
            return nil
        }
        
        // 总是选择中间位置右边的数字做为根结点
        var middle = (left + right + 1) / 2
        let root = TreeNode(nums[middle])
        
        root.left = sortedToBST1(nums, left, middle - 1)
        root.right = sortedToBST1(nums, middle + 1, right)
        return root
    }
    
    // 中序遍历，选择任意一个中间位置做为根结点
    func sortedToBST2(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        guard left <= right else {
            return nil
        }
        
        // 选择任意一个中间位置做为根结点
        var middle = (left + right + Int.random(in: 0..<2)) / 2
        let root = TreeNode(nums[middle])
        
        root.left = sortedToBST2(nums, left, middle-1)
        root.right = sortedToBST2(nums, middle + 1, right)
        return root
    }
    
}
