//
//  ReverseInt.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/25.
//
/*
 7. 整数反转
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。
 假设环境不允许存储 64 位整数（有符号或无符号）。
  
 示例 1：
 输入：x = 123
 输出：321
 
 示例 2：
 输入：x = -123
 输出：-321
 
 示例 3：
 输入：x = 120
 输出：21
 
 示例 4：
 输入：x = 0
 输出：0
 https://leetcode-cn.com/problems/reverse-integer/
 */

import Cocoa

class ReverseInt: NSObject {
    override init() {
        super.init()
        var num = -1212
        let reversed = reverse(&num)
        print("\(reversed)")
    }
    
    func reverse(_ x: inout Int) -> Int {
        var ans = 0
        while x != 0 {
            let lastDigital = x % 10
            ans = ans * 10 + lastDigital
            
            if ans > Int32.max || ans < Int32.min {
                return 0
            }
            x = x/10
        }
        
        return ans
    }
    
    func reverse1(_ x: inout Int) -> Int {
        var res = 0
        while x != 0 {
            let lastDigital = x % 10
            res = res * 10 + lastDigital
            
            if res < Int32.min || res > Int32.max {
                return 0
            }
            x = x / 10
        }
        return res
    }
}
