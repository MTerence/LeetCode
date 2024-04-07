//
//  MaxSubArray.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/12.
//

/*
 53. 最大子数组和
 给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 子数组 是数组中的一个连续部分。

  

 示例 1：

 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 示例 2：

 输入：nums = [1]
 输出：1
 示例 3：

 输入：nums = [5,4,-1,7,8]
 输出：23
 https://leetcode.cn/problems/maximum-subarray/
 https://leetcode.cn/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/
 */
import Cocoa

class MaxSubArray: NSObject {
    // 动态规划
    // dp[i] = max(dp[i-1]+nums[i],num[i])
    // res = max(dp)
    func maxSubArray(_ nums: [Int]) -> Int {
        var pre = 0
        var res = nums[0]
        
        for num in nums {
            pre = max(pre + num, num)
            res = max(pre, res)
        }
        return res
    }
    
    func maxSubArray1(_ nums: [Int]) -> Int {
        var pre = 0
        var res = nums[0]
        for i in 1...nums.count {
            let num = nums[i]
            pre = max(pre + num, num)
            res = max(pre, res)
        }
        return res
    }
    
    /*
    
    __block int a = 1;
    NSLog(@"%d", a);
    dispatch_queue_t myQueue = dispatch_queue_create("com.apple.developer", DISPATCH_QUEUE_SERIAL);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        a = 2;
        NSLog(@"%d", a);
        dispatch_sync(myQueue, ^{
            a = 3;
            NSLog(@"%d", a);
        });
        dispatch_async(myQueue, ^{
            a = 4;
            NSLog(@"%d", a);
        });
        dispatch_async(myQueue, ^{
            a = 5;
            NSLog(@"%d", a);
        });
        a = 6;
        NSLog(@"%d", 6);
    });
    a = 7;
    NSLog(@"%d", a);


    Output:
    1, 7, 2, 6, 3
*/
}
