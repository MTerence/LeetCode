//
//  IsAnagram.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/3.
//

/*
 242. 有效的字母异位词
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
 注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。

 示例 1:
 输入: s = "anagram", t = "nagaram"
 输出: true
 
 示例 2:
 输入: s = "rat", t = "car"
 输出: false
 https://leetcode-cn.com/problems/valid-anagram/
 */
import Cocoa

class IsAnagram: NSObject {
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let s1 = s.sorted()
        let t1 = t.sorted()
        
        return s1 == t1
    }
    
    func isAnagram1(_ s: String, _ t: String) -> Bool {
        var s1 = [Character: Int]()
        var t1 = [Character: Int]()
        
        for c in s {
            if let count = s1[c] {
                s1[c] = count + 1
            } else {
                s1[c] = 1
            }
        }
        
        for c in t {
            if let count = t1[c] {
                t1[c] = count + 1
            } else {
                t1[c] = 1
            }
        }
        return s1 == t1
    }
}
