//
//  SingleNumber.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/25.
//

import Cocoa
/*
 136. 只出现一次的数字 简单
 给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

 示例 1 ：
 输入：nums = [2,2,1]
 输出：1
 
 示例 2 ：
 输入：nums = [4,1,2,1,2]
 输出：4
 
 示例 3 ：
 输入：nums = [1]
 输出：1
 https://leetcode.cn/problems/single-number/description/
 */
class SingleNumber: NSObject {
    
    func singleNumber(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        for num in nums {
            if let count = map[num] {
                map[num] = count + 1
            } else {
                map[num] = 1
            }
        }
        
        guard let value = map.values.first(where: {$0 == 1}) else { return 0}
        return map.getKey(forValue: value) ?? 0
    }
    
    //本质上是位运算
    // 1.任何数与0异或为任何数 0 ^ n => n
    // 2.相同的数异或为0: n ^ n => 0 https://leetcode.cn/problems/single-number/solutions/1324432/136-zhi-chu-xian-yi-ci-de-shu-zi-by-yzf-fopo9/
    func singleNumber1(_ nums: [Int]) -> Int {
         var result = 0
         for num in nums {
             result = result ^ num
         }
         return result
    }
    
    //哈希表 https://leetcode.cn/problems/single-number/solutions/413700/136-zhi-chu-xian-yi-ci-de-shu-zi-by-cobbly/
    func singleNumber2(_ nums: [Int]) -> Int {
      var hashSet = Set<Int>()
    
      for num in nums {
        if hashSet.contains(num) {
          hashSet.remove(num)
        } else {
          hashSet.insert(num)
        }
      }
    
      return hashSet.randomElement()!
    }
}
