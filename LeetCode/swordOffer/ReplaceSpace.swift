//
//  ReplaceSpace.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/24.
//

/*
 剑指 Offer 05. 替换空格
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

 示例 1：
 输入：s = "We are happy."
 输出："We%20are%20happy."
 https://leetcode.cn/problems/ti-huan-kong-ge-lcof/
 */
import Cocoa

class ReplaceSpace: NSObject {
    func replaceSpace(_ s: String) -> String {
        return s.replacingOccurrences(of: " ", with: "%20")
    }
    
    func replaceSpace1(_ s: String) -> String {
        var strArr = Array(s)
        
        //left 执行数组最后一个元素
        var left = strArr.count - 1
        var spacesCount = 0
        for c in strArr {
            if c == " " {
                spacesCount += 1
            }
        }
        
        //对数组进行扩容
        for _ in 0..<spacesCount * 2 {
            strArr.append(" ")
        }
        
        //right指向扩容后数组的最后一个元素
        var right = strArr.count - 1
        
        while left < right {
            if strArr[left] == " " {
                strArr[right] = "0"
                strArr[right - 1] = "2"
                strArr[right - 2] = "%"
                left -= 1
                right -= 3
            } else {
                strArr[right] = strArr[left]
                left -= 1
                right -= 1
            }
        }
        
        return String(strArr)
    }
}
