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
    override init() {
        super.init()
        
        let result = longestPalindrome("babad")
        print("\(result)")
    }
    
    //中心扩散法 - 会超时
    //https://leetcode.cn/problems/longest-palindromic-substring/solution/ren-zhe-suan-fa-chao-ji-qing-xi-yi-dong-o36ol/
    // babad
    func longestPalindrome(_ s: String) -> String {
        var maxSubStrLen = 0
        var subStrStart  = 0
        for (index, c) in s.enumerated() {
            var left  = index - 1
            var right = index + 1
            var curSubStrLen = 1
            while left >= 0 && s.char(at: left) == c {
                left -= 1
                curSubStrLen += 1
            }
            
            while right < s.count && s.char(at: right) == c {
                right += 1
                curSubStrLen += 1
            }
            
            
            while left >= 0 && right < s.count
                    && s.char(at: left) == s.char(at: right)
            {
                left  -= 1
                right += 1
                curSubStrLen += 2
            }
            
            if curSubStrLen > maxSubStrLen {
                maxSubStrLen = curSubStrLen
                subStrStart = left + 1
            }
        }
        
        return s.subStr(start: subStrStart, length: maxSubStrLen) ?? ""
    }
    
    //https://leetcode.cn/problems/longest-palindromic-substring/solution/swift-yuan-lai-yi-zhi-chao-shi-shi-yin-w-6tdi/
    func longestPalindrome1(_ s: String) -> String {
        if s.count < 2 { return s }
        var start = 0
        var end = 0
        let array = s.map({ String.init($0)})
        for i in 0..<s.count {
            let len1 = expendArray(array: array, left: i, righ: i)
            let len2 = expendArray(array: array, left: i, righ: i + 1)
            let len = max(len1, len2)
            
            if len > end - start + 1 {
                start = i - (len-1)/2
                end   = i + len/2
            }
        }
        
        var res: String = ""
        for index in start...end {
            res.append(s[s.index(s.startIndex, offsetBy: index)])
        }
        
        return res
    }
    
    func expendArray(array: [String], left: Int, righ: Int) -> Int {
        var l = left
        var r = righ
        while l >= 0 && r < array.count && array[l] == array[r] {
            l -= 1
            r += 1
        }
        return r - l - 1
    }
}
