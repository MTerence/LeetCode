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
 注意：本题与主站 560 题相同： 
 https://leetcode-cn.com/problems/subarray-sum-equals-k/
 https://leetcode.cn/problems/QTMn0o/
 */
import Cocoa

class SubarraySum: NSObject {
    
    //前缀和
    // nums = [1,2,3], k = 3
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
    
    //时间复杂度: O(n)
    //空间复杂度: O(n)
    //使用前缀和的方法可以解决这个问题，因为我们需要找到和为k的连续子数组的个数。通过计算前缀和，我们可以将问题转化为求解两个前缀和之差等于k的情况。
    //假设数组的前缀和数组为prefixSum，其中prefixSum[i]表示从数组起始位置到第i个位置的元素之和。那么对于任意的两个下标i和j（i < j），如果prefixSum[j] - prefixSum[i] = k，即从第i个位置到第j个位置的元素之和等于k，那么说明从第i+1个位置到第j个位置的连续子数组的和为k。
    //通过遍历数组，计算每个位置的前缀和，并使用一个哈希表来存储每个前缀和出现的次数。在遍历的过程中，我们检查是否存在prefixSum[j] - k的前缀和，如果存在，说明从某个位置到当前位置的连续子数组的和为k，我们将对应的次数累加到结果中。
    //这样，通过遍历一次数组，我们可以统计出和为k的连续子数组的个数，并且时间复杂度为O(n)，其中n为数组的长度。
    //https://leetcode.cn/problems/subarray-sum-equals-k/solutions/247584/swift-qian-zhui-he-by-gesen/
    func subarraySum1(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = 0
        var presum: [Int: Int] = [:]
        var sum: Int = 0

        for i in 0 ..< nums.count {
            sum += nums[i]
            if sum == k { result += 1 }
            if let count = presum[sum - k] { result += count }
            presum[sum, default: 0] += 1
        }

        return result
    }
    
    //https://leetcode.cn/problems/subarray-sum-equals-k/solutions/238572/he-wei-kde-zi-shu-zu-by-leetcode-solution/
    /*
    public int subarraySum(int[] nums, int k) {
        int count = 0;
        for (int start = 0; start < nums.length; ++start) {
            int sum = 0;
            for (int end = start; end >= 0; --end) {
                sum += nums[end];
                if (sum == k) {
                    count++;
                }
            }
        }
        return count;
    }
     */
}
