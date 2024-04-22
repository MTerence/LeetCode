//
//  ChooseSort.swift
//  LeetCode
//
//  Created by 马超 on 2024/1/17.
//
/*
 选择排序
 它的工作原理是：第一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，然后再从剩余的未排序元素中寻找到最小（大）元素，然后放到已排序的序列的末尾。以此类推，直到全部待排序的数据元素的个数为零。选择排序是不稳定的排序方法。
 
 初始状态：无序区为R[0..n-1]（共n个元素），有序区为空
第1趟排序
 设置一个变量i，让i从0至n-2循环的同时，在对比数组中元素i跟元素i+1的大小，如果R[i+1]比R[i]小，则用一个变量k来记住他的位置（即k=i+1）。等到循环结束的时候，我们应该找到了R中最小的那个数的位置了。然后进行判断，如果这个最小元素的不是R的第一个元素，就让第一个元素跟他交换一下值，使R[0..0]和R[1..n-1]分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区。 [1-2]
 ……
第i趟排序
 第i趟排序开始时，当前有序区和无序区分别为R[0..i-1]和R[i..n-1]。该趟排序从当前无序区中选出关键字最小的记录 R[k]，将它与无序区的第1个记录R交换，使R[0..i]和R分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区
 */
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
            swap(nums: &nums, i: index, j: minIndex)
        }
        return nums
    }
    // 交换数组中元素
    func swap(nums: inout [Int], i: Int, j: Int) {
        guard i != j else { return }
        let temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
}
