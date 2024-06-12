//
//  HasPathSum.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/19.
//
/*
 112. 路径总和 简单
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum 。判断该树中是否存在 根节点到叶子节点
 的路径，这条路径上所有节点值相加等于目标和 targetSum 。如果存在，返回 true ；否则，返回 false 。

 叶子节点 是指没有子节点的节点。

 示例 1：
 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 输出：true
 解释：等于目标和的根节点到叶节点路径如上图所示。
 
 示例 2：
 输入：root = [1,2,3], targetSum = 5
 输出：false
 解释：树中存在两条根节点到叶子节点的路径：
 (1 --> 2): 和为 3
 (1 --> 3): 和为 4
 不存在 sum = 5 的根节点到叶子节点的路径。
 示例 3：
 输入：root = [], targetSum = 0
 输出：false
 解释：由于树是空的，所以不存在根节点到叶子节点的路径。
 https://leetcode.cn/problems/path-sum/description/
 */
import Cocoa

class HasPathSum: NSObject {
    // BFS  广度优先搜索的方法也是遍历整个树。使用了两个队列，一个队列记录经过的节点，一个队列记录当前经过节点的路径总和。每次取出两个队列的首元素，路径队列中继续放入当前节点的左右节点（如果为空则不放入），路径总和队列中放入刚刚路径队列的路径总和。然后判断当前取出的节点是否为叶子节点，如果是则继续判断路径总和队列中的值是否为target，如果不是，则继续进行下一次出队循环。
    func hasPathSum(_ root: TreeNode?, targetSum: Int) -> Bool {
        guard let root = root else { return false }
        var nodeQueue: [TreeNode] = [root]
        var valueQueue: [Int] = [root.val]
        while !nodeQueue.isEmpty {
            let curNode = nodeQueue.removeFirst()
            let curValue = valueQueue.removeFirst()
            if curNode.left == nil && curNode.right == nil {
                if curValue == targetSum {
                    return true
                }
                continue
            }
            if let left = curNode.left {
                nodeQueue.append(left)
                valueQueue.append(left.val)
            }
            if let right = curNode.right {
                nodeQueue.append(right)
                valueQueue.append(right.val)
            }
            
        }
        return false
    }
    
    // DFS 使用深度优先的办法，递归遍历整个树；递归查看左右子树的情况，左子树和右子树递归时，为了方便，只需将tagetSum减去root节点之后的值作为新输入即可。根据此逻辑，如果遇到叶子节点，直接判断targetSum是否等于叶子节点的val，如果相等，则表明之前一直减去根节点的值到了叶子节点处正好相等，即到此节点处的sum值为路径总和，返回true，否则返回false；https://leetcode.cn/problems/path-sum/solutions/2054918/shu-de-by-nan-gong-heng-oe8n/
    func hasPathSum1(_ root: TreeNode?, targetSum: Int) -> Bool {
        guard let root = root else { return false }
        if root.left == nil && root.right == nil {
            return targetSum == root.val
        }
        return hasPathSum(root.left, targetSum: targetSum - root.val) ||
        hasPathSum(root.right, targetSum: targetSum - root.val)
    }
}
