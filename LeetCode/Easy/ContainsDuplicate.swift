//
//  ContainsDuplicate.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/2.
//
/*
 217. 存在重复元素
 给你一个整数数组 nums 。如果任一值在数组中出现 至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。
  
 示例 1：
 输入：nums = [1,2,3,1]
 输出：true
 
 示例 2：
 输入：nums = [1,2,3,4]
 输出：false
 
 示例 3：
 输入：nums = [1,1,1,3,3,4,3,2,4,2]
 输出：true
 https://leetcode-cn.com/problems/contains-duplicate/
 */
import Cocoa

class ContainsDuplicate: NSObject {
    //1. 哈希表
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for i in nums {
            if set.contains(i) {
                return true
            }
            set.insert(i)
        }
        return false
    }
    
    //2. 排序遍历，数组重复元素一定出现在相邻位置
    func containsDuplicate1(_ nums: [Int]) -> Bool {
        let array = nums.sorted()
        for i in 0..<array.count - 1 {
            if array[i] == array[i+1] {
                return false
            }
        }
        return true
    }
}

/*
 219. 存在重复元素 II
 给你一个整数数组 nums 和一个整数 k ，判断数组中是否存在两个 不同的索引 i 和 j ，满足 nums[i] == nums[j] 且 abs(i - j) <= k 。如果存在，返回 true ；否则，返回 false 。
 示例 1：
 输入：nums = [1,2,3,1], k = 3
 输出：true
 
 示例 2：
 输入：nums = [1,0,1,1], k = 1
 输出：true
 示例 3：
 输入：nums = [1,2,3,1,2,3], k = 2
 输出：false
 https://leetcode-cn.com/problems/contains-duplicate-ii/
 */
class containsNearbyDuplicate: NSObject {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dic = [Int: Int]()
        for (idx, num) in nums.enumerated() {
            if dic.keys.contains(num) {
                let lastIdx = dic[num]
                if idx - lastIdx! <= k {
                    return true
                }
            }
            dic[num] = idx
        }
        return false
    }
    
    func containsNearbyDuplicate1(_ nums: [Int], _ k: Int) -> Bool {
        var dic = [Int: Int]()
        for (idx, num) in nums.enumerated() {
            if let lastIdx = dic[num] {
                if idx - lastIdx <= k {
                    return true
                }
            }
            dic[num] = idx
        }
        return false
    }
}

/*
 220. 存在重复元素 III
 给你一个整数数组 nums 和两个整数 k 和 t 。请你判断是否存在 两个不同下标 i 和 j，使得 abs(nums[i] - nums[j]) <= t ，同时又满足 abs(i - j) <= k 。
 如果存在则返回 true，不存在返回 false。

 示例 1：
 输入：nums = [1,2,3,1], k = 3, t = 0
 输出：true
 示例 2：
 输入：nums = [1,0,1,1], k = 1, t = 2
 输出：true
 
 示例 3：
 输入：nums = [1,5,9,1,5,9], k = 2, t = 3
 输出：false
 https://leetcode-cn.com/problems/contains-duplicate-iii/
 */
class ContainsNearbyAlmostDuplicate: NSObject {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        return false
    }
}
