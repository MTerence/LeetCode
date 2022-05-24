//
//  LevelOrder.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/16.
//

/*
 剑指 Offer 32 - I. 从上到下打印二叉树
 从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。

  

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回：
 [3,9,20,15,7]
 https://leetcode.cn/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/
 */
import Cocoa

class LevelOrder: NSObject {
    func levelOrder(_ root: TreeNode?) -> [Int]{
        guard let root = root else { return [] }
        var res: [Int] = []
        var treeQueue = [TreeNode]()
        treeQueue.append(root)
        while treeQueue.count > 0 {
            let node = treeQueue.first
            if let nodeLeft = node?.left {
                treeQueue.append(nodeLeft)
            }
            if let nodeRight = node?.right {
                treeQueue.append(nodeRight)
            }
            
            res.append(node!.val)
            treeQueue.removeFirst()
        }
        return res
    }
}
