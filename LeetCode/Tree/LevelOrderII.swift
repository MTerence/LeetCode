//
//  LevelOrderII.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/24.
//

/*
 小红书资深iOS-基础能力
 https://leetcode.cn/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof/
 剑指 Offer 32 - II. 从上到下打印二叉树 II
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]

 提示：
 节点总数 <= 1000
 注意：本题与主站 102 题相同：https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 */
import Cocoa

class LevelOrderII: NSObject {
    /*
             a
       b          c
   d      e   f       g
    */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var subNodeQueue = [TreeNode]()
            var subRes = [Int]()
            
            while !queue.isEmpty {
                let node = queue.removeFirst()
                subRes.append(node.val)
                if node.left != nil {
                    subNodeQueue.append(node.left!)
                }
                if node.right != nil {
                    subNodeQueue.append(node.right!)
                }
            }
            res.append(subRes)
            queue.append(contentsOf: subNodeQueue)
        }
        return res
    }
}
