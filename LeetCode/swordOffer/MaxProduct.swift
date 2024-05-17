//
//  MaxProduct.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/25.
//

/*
 剑指 Offer II 005. 单词长度的最大乘积
 给定一个字符串数组 words，请计算当两个字符串 words[i] 和 words[j] 不包含相同字符时，它们长度的乘积的最大值。假设字符串中只包含英语的小写字母。如果没有不包含相同字符的一对字符串，返回 0。

  
 示例 1:
 输入: words = ["abcw","baz","foo","bar","fxyz","abcdef"]
 输出: 16
 解释: 这两个单词为 "abcw", "fxyz"。它们不包含相同字符，且长度的乘积最大。
 示例 2:

 输入: words = ["a","ab","abc","d","cd","bcd","abcd"]
 输出: 4
 解释: 这两个单词为 "ab", "cd"。
 示例 3:

 输入: words = ["a","aa","aaa","aaaa"]
 输出: 0
 解释: 不存在这样的两个单词。
  

 提示：

 2 <= words.length <= 1000
 1 <= words[i].length <= 1000
 words[i] 仅包含小写字母
 注意：本题与主站 318 题相同：https://leetcode-cn.com/problems/maximum-product-of-word-lengths/
 https://leetcode.cn/problems/aseY1I/
 */
import Cocoa

class MaxProduct: NSObject {
    
    func maxProduct(_ words: [String]) -> Int {
        var hashMap = [Set<Character> : Int]()
        var res = 0
        
        for word in words {
            let set = Set(word)
            
            //判断两个单词之间是否存储重复元素
            for (oldset, oldCount) in hashMap {
                //集合交集为空，则不包含相同字符
                if oldset.intersection(set).count == 0 {
                    res = max(res, oldCount * word.count)
                }
            }
            
            if hashMap.keys.contains(set) {
                //如果包含了这个set，那么更新存储的最大长度
                hashMap[set] = max(hashMap[set]!, word.count)
            } else {
                hashMap[set] = word.count
            }
        }
        return res
    }

}
