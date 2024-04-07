//
//  ChooseSort.swift
//  LeetCode
//
//  Created by 马超 on 2024/1/17.
//

import Cocoa

class ChooseSort: NSObject {
    func chooseSort(_ input: [Int]) -> [Int] {
        guard input.count > 1 else { return input }
        var nums = input
        for (index, num) in nums.enumerated() {
            var minIndex = index
            for indexJ in index+1..<nums.count {
                if num > nums[indexJ] {
                    minIndex = indexJ
                }
            }
            if minIndex != index {
                let temp = nums[minIndex]
                nums[minIndex] = nums[index]
                nums[index] = temp
            }
        }
        return nums
    }
}
