//
//  LongestOrderSubArr.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/24.
//

import Cocoa
/*
 给你一个数组，返回最长有序子数组
 */
class LongestOrderSubArr: NSObject {
    
    override init() {
        super.init()
        let nums = [1, 2, 3, 3, 5, 4, 5, 6, 7]
        let reversed = longestOrderSubArr(nums)
        print("\(reversed)")
    }
    
    func longestOrderSubArr(_ nums:[Int]) -> [Int] {
        if nums.count == 0 || nums.count == 1 { return nums }
        
        var preNum: Int = nums[0]
        var subArr: [Int] = [preNum]
        var window: [Int] = [preNum]
        
        for num in nums {
            if num == preNum + 1 {
                window.append(num)
            } else {
                window.removeAll()
                window.append(num)
            }
            preNum = num
            subArr = subArr.count < window.count ? window : subArr
        }
        return subArr
    }
}
