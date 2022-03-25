//
//  Example1.swift
//  算法
//
//  Created by Ternence on 2021/5/6.
//

import Cocoa

class Example1: NSObject {
    override init() {
        super.init()
        
        print("\(reversalString(inputString: "hello world"))")
        print("\(reversalStringWithWords(inputString: "hello world"))")
        print("\(reverseWords(s: "hello world"))")
        
        print("\(simplifyPath(path: "/a/./b/../c"))")
        print("lengthOfLongestSubstring: \(lengthOfLongestSubstring("pwwkew"))")
        print("findMedianSortedArrays: \(findMedianSortedArrays([0, 0], [0, 0]))")
        print("reverse: \(reverse(123))")
        print("isPalindrome: \(isPalindrome(121))")
        print("longestCommonPrefix: \(longestCommonPrefix(["flower","flow","flight"]))")
        
        var array = [1, 1, 2]
        print("removeDuplicates: \(removeDuplicates(&array))")
        print("array:\(array)")
    }
    
    // 无重复最长子串
    // 输入: s = "abcabcbb"
    // 输出: 3
    // 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        
        var curStr: String = ""
        var maxStr: String = ""
        for character in s {
            while curStr.contains(character) {
                curStr.remove(at: curStr.startIndex)
            }
            curStr.append(character)
            
            if curStr.count > maxStr.count {
                maxStr = curStr
            }
        }
        
        return maxStr.count
    }
    
    //整数反转
    //输入：x = 123
    //输出：321
    func reverse(_ x: Int) -> Int {
        guard x != 0 else { return 0 }
        
        var num = x
        var reverseNum = 0
        while num != 0 {
            let a = num % 10
            num = num / 10
            reverseNum = reverseNum * 10 + a
        }
        
        if reverseNum > Int32.max || reverseNum < Int32.min {
            reverseNum = 0
        }
        
        return reverseNum
    }
    
    //给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。
    //输入：x = 121
    //输出：true
    //输入：x = -121
    //输出：false
    func isPalindrome(_ x: Int) -> Bool {
        guard x > 0 else { return false }
        var numberStr = String(x)
        while numberStr.count > 1 {
            guard numberStr.removeFirst() == numberStr.removeLast() else {
                return false
            }
        }
        return true
    }
    
    //寻找两个正序数组的中位数
    //输入：nums1 = [1,3], nums2 = [2]
    //输出：2.00000
    //解释：合并数组 = [1,2,3] ，中位数 2
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums3 = nums1 + nums2
        nums3 = nums3.sorted()
    
        var nums4: [Int] = []
        for num in nums3 {
            if nums4.contains(num) == false {
                nums4.append(num)
            }
        }
        
        if nums3.count % 2 == 0 {
            return Double((nums3[nums3.count/2 - 1 ] + nums3[nums3.count/2])) / 2.0
        } else {
            return Double(nums3[nums3.count/2])
        }
    }
    
    /*
     14. 最长公共前缀
     编写一个函数来查找字符串数组中的最长公共前缀。
     如果不存在公共前缀，返回空字符串 ""。
     输入：strs = ["flower","flow","flight"]
     输出："fl"
     输入：strs = ["dog","racecar","car"]
     输出：""
     解释：输入不存在公共前缀。
     */
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        guard strs.count > 1 else { return strs.first! }
        var result: String = ""
        let numbers = strs.sorted()
        let first = numbers.first!
        let last  = numbers.last!
        let lastArray = Array(last)
        
        for (idx, character) in first.enumerated() {
            if lastArray[idx] != character {
                return result
            }
            
            result = result + String(character)
        }
        return result
    }
    
    /*
     有效的括号
     给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

     有效字符串需满足：

     左括号必须用相同类型的右括号闭合。
     左括号必须以正确的顺序闭合。

     输入：s = "()"
     输出：true
     输入：s = "()[]{}"
     输出：true
     输入：s = "(]"
     输出：false
     */
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        var stack: [String] = []
        let map = [")":"(", "]":"[", "}":"{"]
        
        for character in s {
            if map.values.contains(character.description) {
                stack.append(character.description)
            } else if map[character.description] != stack.popLast() {
                return false
            }
        }
        
        return stack.count == 0
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var i = 0
        for j in 1..<nums.count {
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack == needle{
            return 0
        }
        if haystack.count < needle.count{
            return -1
        }
        var a:String=haystack
        for i in 0...(a.count-needle.count){
            if a.hasPrefix(needle){
                return i
            }
            a.remove(at:a.startIndex)
        }
        return -1
    }
    
    
    
    fileprivate func _reverse<T>(_ chars: inout[T], _ start: Int, _ end: Int) {
        //接收字符串反转起始、结束位置
        var start = start, end = end
        //判断反转字符串的位置
        while start < end {
            (start, end) = (end, start)
            start += 1
            end -= 1
        }
    }
        
    func swap<T>(_ chars:inout[T], _ p: Int, _ q: Int) {
        (chars[p], chars[q]) = (chars[q], chars[p])
    }
    
    func reverseWords(s: String?) -> String? {
        guard let s = s else { return nil }
        
        var chars = Array(s), start = 0
        _reverse(&chars, 0, chars.count - 1)
        
        for i in 0 ..< chars.count {
            if i == chars.count - 1 || chars[i + 1] == " " {
                _reverse(&chars, start, i)
                start = i + 2
            }
        }
        return String(chars)
    }
    
    // 字符串反转 hello world -> dlrow olleh
    func reversalString(inputString: String?) -> String? {
        guard let inputString = inputString else { return nil }
        
        var outputString = ""
        for (_, str) in inputString.enumerated() {
            outputString.insert(str, at: outputString.startIndex)
        }
        return outputString
    }
    
    //按照单词翻转字符串 hello world -> world hello
    func reversalStringWithWords(inputString: String?) -> String? {
        guard let inputString = inputString else { return nil }
        
        let array = inputString.components(separatedBy: " ")
        var resultArray:[String] = []
        
        for obj in array {
            resultArray.insert(obj, at: 0)
        }
        return (resultArray as NSArray).componentsJoined(by: " ")
    }
    
    func simplifyPath(path: String) -> String {
        //用数组来实现栈的功能
        var pathStack = [String]()
        //拆分原路径
        let paths = path.components(separatedBy: "/")
        
        for path in paths {
            //对于"."直接跳过
            guard path != "." else { continue }
            
            //对于".."使用pop操作
            if path == ".." {
                if pathStack.count > 0 {
                    pathStack.removeLast()
                }
            } else if path != "" { //对于空数组的特殊情况
                pathStack.append(path)
            }
        }
        
        //将栈中内容转化为优化后的新路径
        //let res = pathStack.reduce("") { total, dir in "\"}
        let res = (pathStack as NSArray).componentsJoined(by: "")
        return res
    }
    
}
