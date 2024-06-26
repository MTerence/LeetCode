//
//  MajorityElement.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/24.
//

/*
 剑指 Offer 39. 数组中出现次数超过一半的数字
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:
 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
 输出: 2
  
 限制：
 1 <= 数组长度 <= 50000
 注意：本题与主站 169 题相同：
 https://leetcode-cn.com/problems/majority-element/
 https://leetcode.cn/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/
 https://leetcode.cn/problems/majority-element/description/?envType=study-plan-v2&envId=top-interview-150
 */
import Cocoa

class MajorityElement: NSObject {
    func majorityElement(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        return sorted[sorted.count/2]
    }
}
