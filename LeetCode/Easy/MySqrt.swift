//
//  MySqrt.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//

import Cocoa
/*
 69. x 的平方根
 给你一个非负整数 x ，计算并返回 x 的 算术平方根 。

 由于返回类型是整数，结果只保留 整数部分 ，小数部分将被 舍去 。

 注意：不允许使用任何内置指数函数和算符，例如 pow(x, 0.5) 或者 x ** 0.5 。
 示例 1：
 输入：x = 4
 输出：2
 示例 2：

 输入：x = 8
 输出：2
 解释：8 的算术平方根是 2.82842..., 由于返回类型是整数，小数部分将被舍去。
 https://leetcode-cn.com/problems/sqrtx/
 */
class MySqrt: NSObject {
    override init() {
        super.init()
        let mySqrt = mySqrt(4)
        print("\(mySqrt)")
    }

    // 2分法
    func mySqrt(_ x: Int) -> Int {
        var left = 0, right = x
        var res = -1
        while left <= right {
            let mid = left + (right - left)/2
            if mid * mid <= x {
                left = mid + 1
                res = mid
            } else {
                right = mid - 1
            }
        }
        return res
    }
    
    // 无限逼近法
    func mySqrt1(_ x: Int) -> Int {
        var res = 1
        while res > 0 {
            if res * res < x {
                res+=1
            } else if res * res == x {
                return res
            } else {
                res-=1
                break
            }
        }
        return res
    }
    
    // 0.5 * 0.5 = 0.25
    func mySqrt2(_ x: Double) -> Double {
        if x < 1 { return -1 }
        var res = x
        while res * res > x {
            res -= 0.01
        }
        return res
    }
}
