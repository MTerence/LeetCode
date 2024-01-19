//
//  JudgeSquareSum.swift
//  LeetCode
//
//  Created by 马超 on 2024/1/18.
//

/*
 633. 平方数之和 中等
 给定一个非负整数 c ，你要判断是否存在两个整数 a 和 b，使得 a2 + b2 = c 。

 示例 1：
 输入：c = 5
 输出：true
 解释：1 * 1 + 2 * 2 = 5
 示例 2：
 输入：c = 3
 输出：false
 */
import Cocoa

class JudgeSquareSum: NSObject {
    func judgeSquareSum(_ c: Int) -> Bool {
        var left = 0, right = Int(sqrt(Float(c)))
        // 注意这里是 <=, 否则输入2或8，输出是false，正确输出是true
        while left < right {
            let sum = left*left + right*right
            if sum < c {
                left += 1
            } else if sum > c {
                right -= 1
            } else { return true }
        }
        return false
    }
}
