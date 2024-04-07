//
//  IsValid.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/28.
//
/*
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
  
 示例 1：
 输入：s = "()"
 输出：true
 
 示例 2：
 输入：s = "()[]{}"
 输出：true
 
 示例 3：
 输入：s = "(]"
 输出：false
 
 示例 4：
 输入：s = "([)]"
 输出：false
 
 示例 5：
 输入：s = "{[]}"
 输出：true
 https://leetcode-cn.com/problems/valid-parentheses/
 */
import Cocoa

class IsValid: NSObject {
    override init() {
        super.init()
        let isValid = isValid1("[{}}")
        print("\(isValid)")
    }
    
    func isValid(_ s: String) -> Bool {
        var array: [Character] = []
        
        for c in s {
            if c == "(" || c == "[" || c == "{" {
                array.append(c)
            } else {
                if array.count == 0 { return false }
                if c == ")" && array.popLast() != "(" { return false }
                if c == "]" && array.popLast() != "[" { return false }
                if c == "}" && array.popLast() != "{" { return false }
            }
        }
        
        return array.count == 0
    }
    
    func isValid1(_ s: String) -> Bool {
        let map: [Character: Character] = ["}": "{", "]": "[", ")": "("]
        var lefts: [Character] = []
        for c in s {
            if map.values.contains(c) {
                lefts.append(c)
            } else {
                if lefts.count == 0 { return false }
                if map[c] != lefts.removeLast() { return false }
            }
        }
        
        return lefts.count == 0
    }
}
