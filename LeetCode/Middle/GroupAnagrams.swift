//
//  GroupAnagrams.swift
//  LeetCode
//
//  Created by 马超 on 2024/6/1.
//
/*
 给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。
 字母异位词 是由重新排列源单词的所有字母得到的一个新单词。
 示例 1:
 输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
 输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
 示例 2:
 输入: strs = [""]
 输出: [[""]]
 示例 3:
 输入: strs = ["a"]
 输出: [["a"]]
 */
import Cocoa

class GroupAnagrams: NSObject {
    /**
     利用词的某种格式作为key，存储到哈希表中
     https://leetcode.cn/problems/group-anagrams/solutions/1216816/gryffindor-49-zi-mu-yi-wei-ci-fen-zu-by-g5l2c/
     */
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dic = [String: [String]]()
        var array: [String] = []
        array.append("")
        for str in strs {
            let key = String(str.sorted())
            if var strArray = dic[key] {
                strArray.append(str)
                dic[key] = strArray
            } else {
                dic[key] = [str]
            }
        }
        return Array(dic.values)
    }
}
