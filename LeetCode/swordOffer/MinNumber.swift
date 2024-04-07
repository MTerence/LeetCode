//
//  MinNumber.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/16.
//

/*
 剑指 Offer 45. 把数组排成最小的数
 输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
 
 示例 1:
 输入: [10,2]
 输出: "102"
 示例 2:
 输入: [3,30,34,5,9]
 输出: "3033459"

 提示:
 0 < nums.length <= 100
 说明:
 输出结果可能非常大，所以你需要返回一个字符串而不是整数
 拼接起来的数字可能会有前导 0，最后结果不需要去掉前导 0
 https://leetcode.cn/problems/ba-shu-zu-pai-cheng-zui-xiao-de-shu-lcof/
 */
import Cocoa

class MinNumber: NSObject {
    func minNumber(_ nums: [Int]) -> String {
        let strArray = nums.map{ String($0)}
        let _ = strArray.sorted(by: {$0 + $1 < $1 + $0} )
        return strArray.joined(separator: "")
    }
    
    func minNumber1(_ nums: [Int]) -> String {
        func fast_sort(_ left: String, _ right: String) -> Bool {
            return left + right < right + left
        }
        
        let strArray = nums.map{ String($0) }
        let _ = strArray.sorted(by: fast_sort(_:_:))
        return strArray.joined(separator: "")
    }
}
