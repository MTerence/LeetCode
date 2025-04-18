//
//  NumSubarrayProductLessThanK.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/25.
//

/*
 剑指 Offer II 009. 乘积小于 K 的子数组
 给定一个正整数数组 nums和整数 k ，请找出该数组内乘积小于 k 的连续的子数组的个数。
 示例 1:
 输入: nums = [10,5,2,6], k = 100
 输出: 8
 解释: 8 个乘积小于 100 的子数组分别为: [10], [5], [2], [6], [10,5], [5,2], [2,6], [5,2,6]。
 需要注意的是 [10,5,2] 并不是乘积小于100的子数组。
 示例 2:
 输入: nums = [1,2,3], k = 0
 输出: 0

 提示:
 1 <= nums.length <= 3 * 104
 1 <= nums[i] <= 1000
 0 <= k <= 106
 注意：本题与主站 713 题相同：https://leetcode-cn.com/problems/subarray-product-less-than-k/
 https://leetcode.cn/problems/ZVAVXX/
 */
import Cocoa

class NumSubarrayProductLessThanK: NSObject {
    
    // 滑窗算是双指针中的特殊情况。
    // 要理解滑窗很重要的是理解两个滑窗边界有什么意义。
    // 滑窗可能分为固定窗口大小和变长窗口大小，这题便是变长窗口，我们要理解为什么窗口是变长的。
    // 然后这题跟209. 长度最小的子数组是一个方法，理解这题后可以用209这题巩固巩固
    // (209这题是维护窗口最小长度，本题是维护窗口最大长度)
    //https://leetcode.cn/problems/subarray-product-less-than-k/solutions/1373555/hua-dong-chuang-kou-by-fenjue-xvg5/
    
    
    //https://leetcode.cn/problems/subarray-product-less-than-k/solution/cheng-ji-xiao-yu-k-de-zi-shu-zu-by-leetc-92wl/
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var window = 1
        var startIndex = 0
        for (endIndex, num) in nums.enumerated() {
            window *= num
            
            while startIndex <= endIndex && window >= k {
                window = window / nums[startIndex]
                startIndex += 1
            }
            
            // 每次右指针位移到一个新位置，应该加上 x 种数组组合：
            //  nums[endIndex]
            //  nums[endIndex-1], nums[endIndex]
            //  nums[endIndex-2], nums[endIndex-1], nums[endIndex]
            //  nums[startIndex], ......, nums[endIndex-2], nums[endIndex-1], nums[endIndex]
            //共有 right - left + 1 种
            
            //如果一个子串的乘积小于k，那么他的每个子集都小于k，而一个长度为n的数组，他的所有连续子串数量是1+2+...n，但是会和前面的重复。 比如例子中[10, 5, 2, 6]，第一个满足条件的子串是[10]，第二个满足的是[10, 5]，但是第二个数组的子集[10]和前面的已经重复了，因此我们只需要计算包含最右边的数字的子串数量，就不会重复了，也就是在计算[10, 5]这个数组的子串是，只加入[5]和[10, 5]，而不加入[10]，这部分的子串数量刚好是r - l + 1
            res += endIndex - startIndex + 1
        }
        return res
    }
}
