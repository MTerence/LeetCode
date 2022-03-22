//
//  TwoSum.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/22.
//

/*
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
 你可以按任意顺序返回答案。

 示例 1：
 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class TwoSum: NSObject {
    
    override init() {
        super.init()
        
        let result = twoSum2([2,7,11,15], 9)
        print("\(result)")
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var set: Set<Int> = Set()
        
        for (index,num) in nums.enumerated() {
            let value = target - num
            if set.contains(value) {
                if let firIndex = nums.firstIndex(of: value) {
                    return [firIndex, index]
                }
            }
            set.insert(num)
        }
        return []
    }
    
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for (index, num) in nums.enumerated() {
            let value = target - num
            if let firstIndex = dict.getKey(forValue: value) {
                return [firstIndex, index]
            }
            
            dict[index] = num
        }
        return []
    }
    
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for (index, num) in nums.enumerated() {
            let value = target - num
            if dict.keys.contains(value) {
                if let firIndex = dict[value] {
                    return [firIndex, index]
                }
            }
            
            dict[num] = index
        }
        return []
        
    }
}

extension Dictionary where Value: Equatable {
    func getKey(forValue val: Value) -> Key? {
        return first(where: {$0.value == val})?.key
    }
}
