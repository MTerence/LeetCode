//
//  SumNums.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/14.
//

/*
 剑指 Offer 64. 求1+2+…+n
 求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。
 示例 1：
 输入: n = 3
 输出: 6
 示例 2：
 输入: n = 9
 输出: 45
  
 限制：
 1 <= n <= 10000
 https://leetcode.cn/problems/qiu-12n-lcof/
 */
import Cocoa

class SumNums: NSObject {
    func sumNums(_ n: Int) -> Int {
        return Array(1...n).reduce(0, +)
    }
    
    
    func sumNums1(_ n: Int) -> Int {
        return n == 0 ? 0 : n + sumNums1(n-1)
    }
}
