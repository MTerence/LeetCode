//
//  IsPowerOfThree.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/19.
//
/*
 326. 3 的幂简单
 给定一个整数，写一个函数来判断它是否是 3 的幂次方。如果是，返回 true ；否则，返回 false 。

 整数 n 是 3 的幂次方需满足：存在整数 x 使得 n == 3x

 示例 1：
 输入：n = 27
 输出：true
 示例 2：
 输入：n = 0
 输出：false
 示例 3：
 输入：n = 9
 输出：true
 示例 4：
 输入：n = 45
 输出：false
 https://leetcode.cn/problems/power-of-three/description/
 */
import Cocoa

class IsPowerOfThree: NSObject {
    // 试除法
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n >= 0 else {
            return false
        }
        var number = n
        while number != 0 && number % 3 == 0 {
            number /= 3
        }
        return number == 1
    }
    
    //
    func isPowerOfThree1(_ n: Int) -> Bool {
        var t = 1
        while t < n {
            t *= 3
        }
        return t == n
    }
}
