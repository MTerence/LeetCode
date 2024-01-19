//
//  LongestCommonPrefix.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/28.
//
/*
 14. 最长公共前缀
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。
 示例 1：
 输入：strs = ["flower","flow","flight"]
 输出："fl"
 
 示例 2：
 输入：strs = ["dog","racecar","car"]
 输出：""
 解释：输入不存在公共前缀。
 https://leetcode-cn.com/problems/longest-common-prefix/
 */

import Cocoa


class LongestCommonPrefix: NSObject {
    override init() {
        super.init()
        let longestCommonPrefix = longestCommonPrefix3(["fllower","fllow","fllight"])
        print("\(longestCommonPrefix)")
    }

    //1.
    func longestCommonPrefix(_ strs: [String]) -> String {
        let sortedStrs = strs.sorted()
        let first = sortedStrs.first!
        let last = sortedStrs.last!
        var result = ""
        for (idx, c) in first.enumerated() {
            if last.char(at: idx) != c {
                return result
            }
            result.append(c)
        }
        return result
    }
    
    // 2. 纵向扫描
    // fllower
    // fllow
    // fllight
    func longestCommonPrefix1(_ strs: [String]) -> String {
        if strs.count == 0 { return "" }
        let rows = strs.count   //行
        let cols = strs.first!.count    //列 = “fllower”.count = 7
        for i in 0..<cols {
            let firstChar = strs[0].char(at: i)
            for j in 1..<rows {
                if strs[j].count == i { return String(strs[0].prefix(i)) }
                let eachRowChar = strs[j].char(at: i)
                if eachRowChar != firstChar {
                    return String(strs[0].prefix(i))
                }
            }
        }
        return strs[0]
    }
    
    // 3. 横向扫描
    func longestCommonPrefix2(_ strs: [String]) -> String {
        if strs.count == 0 { return "" }
        var prefix = strs[0]
        for i in 1..<strs.count {
            prefix = longestTwoPrefix(prefix, strs[i])
            if prefix.count == 0 { return "" }
        }
        return prefix
    }
    
    func longestTwoPrefix(_ str1: String, _ str2: String) -> String {
        let length = min(str1.count, str2.count)
        var index = 0
        while index < length && str1.char(at: index) == str2.char(at: index) {
            index += 1
        }
        
        return String(str1.prefix(index))
    }
    
    // 4. 分治算法
    func longestCommonPrefix3(_ strs: [String]) -> String {
        if strs.count == 0 { return "" }
        return lcp(strs, left: 0, right: strs.count-1)
    }
    
    func lcp(_ strs: [String], left: Int, right: Int) -> String {
        if left == right { return strs[left] }
        let mid = left + (right - left) / 2
        let leftLcp = lcp(strs, left: left, right: mid)
        let rightLcp = lcp(strs, left: mid + 1, right: right)
        
        return longestTwoPrefix(leftLcp, rightLcp)
    }
}

extension LongestCommonPrefix {
    func longestCommentPrefix(_ strs: [String]) -> String {
        let sortedArray = strs.sorted()
        let first = sortedArray.first
        let last = sortedArray.last
        var result = ""
        for (index, c) in (first ?? "").enumerated() {
            if (last ?? "").char(at: index) != c {
                return result
            }
            result.append(c)
        }
        return result
    }
}
