//
//  ZigzagLevelOrder.swift
//  LeetCode
//
//  Created by 马超 on 2025/4/9.
//
/**
 xhs直播二面
 
 103. 二叉树的锯齿形层序遍历 中等
 给你二叉树的根节点 root ，返回其节点值的 锯齿形层序遍历 。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

 示例 1：
 输入：root = [3,9,20,null,null,15,7]
 输出：[[3],[20,9],[15,7]]
 
 示例 2：
 输入：root = [1]
 输出：[[1]]
 
 示例 3：
 输入：root = []
 输出：[]
 https://leetcode.cn/problems/binary-tree-zigzag-level-order-traversal/
 */
import Cocoa

class ZigzagLevelOrder: NSObject {
    // https://leetcode.cn/problems/binary-tree-zigzag-level-order-traversal/solutions/244766/swift-bfs-100-by-gesen/
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
         guard let root = root else { return [] }

         var result: [[Int]] = []
         var queue: [TreeNode] = [root]
         var isLTR = true

         while !queue.isEmpty {
             var levelResult: [Int] = []
             var tempQueue: [TreeNode] = []

             for i in 0 ..< queue.count {
                 levelResult.append(queue[i].val)
                 if let left = queue[i].left { tempQueue.append(left) }
                 if let right = queue[i].right { tempQueue.append(right) }
             }

             result.append(isLTR ? levelResult : levelResult.reversed())
             queue = tempQueue
             isLTR.toggle()
         }

         return result
     }
    
    //https://leetcode.cn/problems/binary-tree-zigzag-level-order-traversal/solutions/992678/er-cha-shu-de-ju-chi-xing-ceng-xu-bian-l-a024/
    func zigzagLevelOrder1(_ root: TreeNode?) -> [[Int]] {
        var arr = [[Int]]()
        func loop(_ node: TreeNode?, _ h: Int) {
            if node == nil { return }
            if arr.count <= h { arr.append([]) }
            if h % 2 == 1 {
                arr[h].insert(node!.val, at: 0)
            } else {
                arr[h].append(node!.val)
            }

            loop(node!.left,  h + 1)
            loop(node!.right, h + 1)
        }

        loop(root, 0)
        return arr
    }
}
