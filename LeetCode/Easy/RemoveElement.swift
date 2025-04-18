//
//  RemoveElement.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//

/*
 27. 移除元素
 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

 说明:
 为什么返回数值是整数，但输出的答案是数组呢?
 请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。
 你可以想象内部操作如下:
 // nums 是以“引用”方式传递的。也就是说，不对实参作任何拷贝
 int len = removeElement(nums, val);

 // 在函数里修改输入数组对于调用者是可见的。
 // 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
 for (int i = 0; i < len; i++) {
     print(nums[i]);
 }
  
 示例 1：
 输入：nums = [3,2,2,3], val = 3
 输出：2, nums = [2,2]
 解释：函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。你不需要考虑数组中超出新长度后面的元素。例如，函数返回的新长度为 2 ，而 nums = [2,2,3,3] 或 nums = [2,2,0,0]，也会被视作正确答案。
 
 示例 2：
 输入：nums = [0,1,2,2,3,0,4,2], val = 2
 输出：5, nums = [0,1,3,0,4]
 解释：函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。注意这五个元素可为任意顺序。你不需要考虑数组中超出新长度后面的元素。
 https://leetcode-cn.com/problems/remove-element/
 */
import Cocoa

class RemoveElement: NSObject {
    override init() {
        super.init()
        var input = [3,2,2,3]
        let removeElement = removeElement(&input, 3)

        print("\(removeElement)")
    }
    
    func removeElement0(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter({$0 != val})
        return nums.count
    }
    
    // 单向双指针 https://leetcode.cn/problems/remove-element/solutions/1214245/yi-chu-yuan-su-swift-by-stone_n-v8na/?envType=study-plan-v2&envId=top-interview-150
    //nums = [3,2,2,3], val = 3
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        var retIdx = 0
        for index in 0..<nums.count {
            if nums[index] != val {
                nums[retIdx] = nums[index]
                retIdx += 1
            }
        }
        return retIdx
    }
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var idx = 0
        while idx < nums.count {
            let num = nums[idx]
            if num == val {
                nums.remove(at: idx)
                if idx > 0 {
                    idx -= 1
                }
            } else {
                idx += 1
            }
        }
        return nums.count
    }
    
    // 双指针法 [3,2,2,3] 3
    func removeElement1(_ nums: inout [Int], _ val: Int) -> Int {
        var slow = 0
        var fast = 0
        
        while fast < nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }
}
