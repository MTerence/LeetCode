//
//  SearchInsert.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/15.
//
/*
 35. 搜索插入位置 简单
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 请必须使用时间复杂度为 O(log n) 的算法。

 示例 1:
 输入: nums = [1,3,5,6], target = 5
 输出: 2
 示例 2:
 输入: nums = [1,3,5,6], target = 2
 输出: 1
 示例 3:
 输入: nums = [1,3,5,6], target = 7
 输出: 4
 https://leetcode.cn/problems/search-insert-position/description/
 */
import Cocoa

class SearchInsert: NSObject {
    
    //暴力解法
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        // 分别处理如下三种情况
        // 目标值在数组所有元素之前
        // 目标值等于数组中某一个元素
        // 目标值插入数组中的位置
        //时间复杂度：O(n)
        //时间复杂度：O(1)
        //https://leetcode.cn/problems/search-insert-position/solutions/1705568/by-carlsun-2-2dlr/
        for (i, num) in nums.enumerated() {
            // 一旦发现大于或者等于target的num[i]，那么i就是我们要的结果
            if num >= target {
                return i
            }
        }
        // 目标值在数组所有元素之后的情况
        return nums.count
    }
    
    func searchInsert1(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right { // 当left==right时，区间[left, right]依然有效
            let middle = left + (right-left)/2 // 防止溢出，等同于(left+right)/2
            if nums[middle] > target {
                left = middle+1 // target在左区间，所以[left, middle-1]
            } else if nums[middle] < target {
                right = middle-1 // target在右区间，所以[middle+1, right]
            } else {
                return middle // nums[middle] == target
            }
        }
        // 区间里没有目标值，则放在数组最后
        return right+1
    }
}
