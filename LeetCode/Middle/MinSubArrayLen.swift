//
//  MinSubArrayLen.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/24.
//

/*
 https://leetcode.cn/problems/minimum-size-subarray-sum/
 209. 长度最小的子数组
 给定一个含有 n 个正整数的数组和一个正整数 target 。

 找出该数组中满足其和 ≥ target 的长度最小的 连续子数组 [numsl, numsl+1, ..., numsr-1, numsr] ，并返回其长度。如果不存在符合条件的子数组，返回 0 。
 示例 1：
 输入：target = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
 
 示例 2：
 输入：target = 4, nums = [1,4,4]
 输出：1
 
 示例 3：
 输入：target = 11, nums = [1,1,1,1,1,1,1,1]
 输出：0
 */
import Cocoa

class MinSubArrayLen: NSObject {
    
    override init() {
        super.init()
        
        let result = minSubArrayLen(7,  [2,3,1,2,4,3])
        print("\(result)")
    }
    
    //滑动窗口
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        if nums.count == 1 { return nums[0] == target ? 1 : 0 }
        
        var startIndex = 0
        var window = 0
        var res = Int.max
        
        for endIndex in 0..<nums.count {
            window += nums[endIndex]
            
            while window >= target {
                res = min(res, endIndex - startIndex + 1)
                window -= nums[startIndex]
                startIndex += 1
            }
        }
        return res == Int.max ? 0 : res
    }
}
