//
//  PlusOne.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//

/*
 66. 加一
 给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
 你可以假设除了整数 0 之外，这个整数不会以零开头。

 示例 1：
 输入：digits = [1,2,3]
 输出：[1,2,4]
 解释：输入数组表示数字 123。
 示例 2：
 输入：digits = [4,3,2,1]
 输出：[4,3,2,2]
 解释：输入数组表示数字 4321。
 示例 3：
 输入：digits = [0]
 输出：[1]
 https://leetcode-cn.com/problems/plus-one/
 */
import Cocoa

class PlusOne: NSObject {
    override init() {
        super.init()
        
        //let plusOne = plusOne1([4,3,2,1])
        let plusOne = plusOne1([9])
        print("\(plusOne)")
    }
    
    func plusOne1(_ digits: [Int]) -> [Int] {
        var index = 0
        var flag = 1
        var result: [Int] = []
        var reversed = Array(digits.reversed())
        while index < digits.count {
            let cur = reversed[index] + flag
            if cur > 9 {
                flag = 1
                reversed[index] = 0
            } else {
                reversed[index] = cur
                flag = 0
            }
            index += 1
        }
        
        result = reversed.reversed()
        if flag == 1 {
            result.insert(1, at: 0)
        }
        return result
    }
    
    
}
