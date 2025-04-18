//
//  IsPalindrome.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/25.
//

/*
 9. 回文数
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。
 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 例如，121 是回文，而 123 不是。

 示例 1：
 输入：x = 121
 输出：true
 
 示例 2：
 输入：x = -121
 输出：false
 解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 https://leetcode-cn.com/problems/palindrome-number/
 */

import Cocoa

class IsPalindrome: NSObject {
    override init() {
        super.init()
        let isPalindrome = isPalindrome(1221)
        print("\(isPalindrome)")
    }
    
    func isPalindrome(_ x: Int) -> Bool {
        var str = String(x)
        while str.count > 0 {
            if str.removeFirst() != str.removeLast() {
                return false
            }
        }
        
        return true
    }
    
    
    func isPalindrome1(_ x: Int) -> Bool {
        let str = String(x)
        return str == String(str.reversed())
    }
    
    func isPalindrome2(_ x: Int) -> Bool {
        let str = String(x)
        var left = 0
        var right = str.count - 1
        while left <= right {
            if str.char(at: left) != str.char(at: right) {
                return false
            }
            left  += 1
            right -= 1
        }
        
        return true
    }
    
    func isPalindrome3(_ x: Int) -> Bool {
        // 如上所述，当 x < 0 时，x 不是回文数。
        // 同样地，如果数字的最后一位是 0，为了使该数字为回文，
        // 则其第一位数字也应该是 0
        // 只有 0 满足这一属性
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var reversedNum = 0
        var num = x
        while num > reversedNum {
            reversedNum = x * 10 + x % 10
            num = x / 10
        }
        // 当数字长度为奇数时，我们可以通过 revertedNumber/10 去除处于中位的数字。
        // 例如，当输入为 12321 时，在 while 循环的末尾我们可以得到 x = 12，revertedNumber = 123，
        // 由于处于中位的数字不影响回文（它总是与自己相等），所以我们可以简单地将其去除。
        return x == reversedNum || x == reversedNum / 10
    }

}
