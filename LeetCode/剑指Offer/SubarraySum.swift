//
//  SubarraySum.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/25.
//

/*
 剑指 Offer II 010. 和为 k 的子数组
 给定一个整数数组和一个整数 k ，请找到该数组中和为 k 的连续子数组的个数。

 示例 1：
 输入:nums = [1,1,1], k = 2
 输出: 2
 解释: 此题 [1,1] 与 [1,1] 为两种不同的情况
 示例 2：
 输入:nums = [1,2,3], k = 3
 输出: 2
 提示:
 1 <= nums.length <= 2 * 104
 -1000 <= nums[i] <= 1000
 -107 <= k <= 107
 注意：本题与主站 560 题相同： https://leetcode-cn.com/problems/subarray-sum-equals-k/
 https://leetcode.cn/problems/QTMn0o/
 */
import Cocoa

class SubarraySum: NSObject {
    
    //前缀和
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var preSum = 0  //记录上一次的前缀和，
        var map = [Int : Int]()
        map[0] = 1
        
        for i in 0..<nums.count {
            //累加前缀和
            preSum += nums[i]
            
            if let count = map[preSum - k] {
                res += count
            }
            map[preSum, default: 0] += 1
        }
        return res
    }
}
