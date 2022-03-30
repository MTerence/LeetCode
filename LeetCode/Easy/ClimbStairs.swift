//
//  ClimbStairs.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//

import Cocoa
/*
 70. 爬楼梯
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 示例 1：
 输入：n = 2
 输出：2
 解释：有两种方法可以爬到楼顶。
 1. 1 阶 + 1 阶
 2. 2 阶
 示例 2：

 输入：n = 3
 输出：3
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶
 2. 1 阶 + 2 阶
 3. 2 阶 + 1 阶
 https://leetcode-cn.com/problems/climbing-stairs/
 */
class ClimbStairs: NSObject {
    
    override init() {
        super.init()
        let climbStairs = climbStairs(4)
        print("\(climbStairs)")
    }
    
    var dic: [Int: Int] = [:]
    func climbStairs(_ n: Int) -> Int {
        if n == 1 || n == 2 { return n }
        if dic.keys.contains(n) {
            return dic[n]!
        }
        let sum = climbStairs(n-1) + climbStairs(n-2)
        dic[n] = sum
        return sum
    }
}
