//
//  NumWays.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/15.
//

/*
 剑指 Offer 10- II. 青蛙跳台阶问题
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。
 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：
 输入：n = 2
 输出：2
 示例 2：
 输入：n = 7
 输出：21
 示例 3：
 输入：n = 0
 输出：1
 
 https://leetcode.cn/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/
 */
import Cocoa

class NumWays: NSObject {
    
    
    var dic: [Int: Int] = [:]
    func numWays(_ n: Int) -> Int {
         if n == 0 { return 1 }
         if n == 1 || n == 2 { return n }
         if dic.keys.contains(n) {
             return dic[n]!
         }
         let sum = numWays(n-1) + numWays(n-2)
         dic[n] = sum
         return sum % 1000000007
     }
}
