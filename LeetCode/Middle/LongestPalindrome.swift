//
//  LongestPalindrome.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/7.
//

/*
 5. 最长回文子串
 给你一个字符串 s，找到 s 中最长的回文子串。

 示例 1：
 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：
 输入：s = "cbbd"
 输出："bb"
 https://leetcode-cn.com/problems/longest-palindromic-substring/
 */

import Cocoa

class LongestPalindrome: NSObject {
    // 中心扩散法
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        var maxStrLen = 0
        var maxSubStrStart = 0
        for (idx, c) in s.enumerated() {
            var left  = idx - 1
            var right = idx + 1
            var currentSubStrLen = 1
            while left >= 0 && s.char(at: left) == c {
                left -= 1
                currentSubStrLen += 1
            }
            
            while right < s.count && s.char(at: right) == c {
                right += 1
                currentSubStrLen += 1
            }
            
            while left >= 0 && right < s.count && s.char(at: left) == s.char(at: right) {
                left  -= 1
                right += 1
                currentSubStrLen += 2
            }
            
            
            if currentSubStrLen > maxStrLen {
                maxStrLen = currentSubStrLen
                maxSubStrStart = left + 1
            }
        }
        
        return s.substr(maxSubStrStart, length: UInt(maxStrLen)) ?? ""
    }
}
