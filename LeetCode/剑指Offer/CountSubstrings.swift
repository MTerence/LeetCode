//
//  CountSubstrings.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/14.
//

import Cocoa

/*
 剑指 Offer II 020. 回文子字符串的个数
 给定一个字符串 s ，请计算这个字符串中有多少个回文子字符串。

 具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被视作不同的子串。

  

 示例 1：
 输入：s = "abc"
 输出：3
 解释：三个回文子串: "a", "b", "c"
 
 示例 2：
 输入：s = "aaa"
 输出：6
 解释：6个回文子串: "a", "a", "a", "aa", "aa", "aaa"
 https://leetcode.cn/problems/a7VOhD/
 */

class CountSubstrings: NSObject {
    override init() {
        super.init()
        
        let result = countSubstrings1("aaa")
        print("\(result)")
    }
    
    func countSubstrings1(_ s: String) -> Int {
        var count: Int = 0
        for index in 0..<s.count {
            count += countPalindrome(s: s, start: index, end: index)
            count += countPalindrome(s: s, start: index, end: index + 1)
        }
        return count
    }

    func countPalindrome(s: String, start: Int, end: Int) -> Int {
        var left = start
        var right = end
        var count: Int = 0
        while left >= 0 && right < s.count && s.char(at: left) == s.char(at: right) {
            left -= 1
            right += 1
            count += 1
        }
        return count
    }
    
    func countSubstrings(_ s: String) -> Int {
        if s.count == 0 || s.count == 1{ return s.count }
        var count: Int = 0
        
        for indexI in 0..<s.count {
            for indexJ in indexI + 1..<s.count {
                let str = s.substr(indexJ, length: UInt(indexJ - indexI))
                if let str = str,
                   isPalindrome(str) {
                    count += 1
                }
            }
        }
        return count
    }
    
    func isPalindrome(_ str: String) -> Bool {
        if str.count == 1 { return true }
        
        var left: Int = 0
        var right : Int = str.count
        while left <= right {
            if str.char(at: left) != str.char(at: right) {
                return false
            }
            left  += 1
            right -= 1
        }
        return true
    }
    
}


/*
class Solution {
    public int countSubstrings(String s) {
        if (s == null || s.length() == 0) {
            return 0;
        }
        int count = 0;
        //字符串的每个字符都作为回文中心进行判断，中心是一个字符或两个字符
        for (int i = 0; i < s.length(); ++i) {
            count += countPalindrome(s, i, i);
            count += countPalindrome(s, i, i+1);
        }
        return count;
    }

    //从字符串的第start位置向左，end位置向右，比较是否为回文并计数
    private int countPalindrome(String s, int start, int end) {
        int count = 0;
        while (start >= 0 && end < s.length() && s.charAt(start) == s.charAt(end)) {
            count++;
            start--;
            end++;
        }
        return count;
    }
}
*/
