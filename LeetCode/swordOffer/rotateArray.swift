//
//  rotateArray.swift
//  LeetCode
//
//  Created by 马超 on 2024/1/17.
//

import Cocoa
/**
 189. 轮转数组 中等
 给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。

 示例 1:
 输入: nums = [1,2,3,4,5,6,7], k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右轮转 1 步: [7,1,2,3,4,5,6]
 向右轮转 2 步: [6,7,1,2,3,4,5]
 向右轮转 3 步: [5,6,7,1,2,3,4]
 
 示例 2:
 输入：nums = [-1,-100,3,99], k = 2
 输出：[3,99,-1,-100]
 解释:
 向右轮转 1 步: [99,-1,-100,3]
 向右轮转 2 步: [3,99,-1,-100]

 提示：
 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
  
 进阶：
 尽可能想出更多的解决方案，至少有 三种 不同的方法可以解决这个问题。
 你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？
 https://leetcode.cn/problems/rotate-array/description/
 */
class rotateArray: NSObject {
    //根据题意，如果使用多余数组存储空间，会导致空间复杂度为 nnn，所以在这里，我们可以使用常量级的空间复杂度解法：数组翻转。
    
    // 首先对整个数组实行翻转，这样子原数组中需要翻转的子数组，就会跑到数组最前面。
    // 这时候，从 k 处分隔数组，左右两数组，各自进行翻转即可。
    // https://leetcode.cn/problems/rotate-array/solutions/683855/shu-zu-fan-zhuan-xuan-zhuan-shu-zu-by-de-5937/
    func rotate(_ nums: inout [Int], _ k: Int){
        let k = k % nums.count
        reverseArray(&nums, left: 0, right: nums.count - 1)
        reverseArray(&nums, left: 0, right: k - 1)
        reverseArray(&nums, left: k, right: nums.count - 1)
    }
    func reverseArray(_ nums: inout [Int], left: Int, right: Int) {
        var left = left, right = right
        while left < right {
            let temp = nums[left]
            nums[left] = nums[right]
            nums[right] = temp
            left += 1
            right -= 1
        }
    }
}
