//
//  QuickSort.swift
//  LeetCode
//
//  Created by 马超 on 2024/1/17.
//

import Cocoa

/*
 快速排序采用的是分治思想，即在一个无序的序列中选取一个任意的基准元素pivot，利用pivot将待排序的序列分成两部分，前面部分元素均小于或等于基准元素，后面部分均大于或等于基准元素，然后采用递归的方法分别对前后两部分重复上述操作，直到将无序序列排列成有序序列。
 快速排序算法通过多次比较和交换来实现排序，其排序流程如下：
 1、首先设定一个分界值，通过该分界值将数组分成左右两部分。
 2、将大于或等于分界值的数据集中到数组右边，小于分界值的数据集中到数组的左边。此时，左边部分中各元素都小于分界值，而右边部分中各元素都大于或等于分界值。 [2]
 3、然后，左边和右边的数据可以独立排序。对于左侧的数组数据，又可以取一个分界值，将该部分数据分成左右两部分，同样在左边放置较小值，右边放置较大值。右侧的数组数据也可以做类似处理。
 4、重复上述过程，可以看出，这是一个递归定义。通过递归将左侧部分排好序后，再递归排好右侧部分的顺序。当左、右两个部分各数据排序完成后，整个数组的排序也就完成了
 
 快速排序的一次划分算法从两头交替搜索，直到low和hight重合，因此其时间复杂度是O(n)；而整个快速排序算法的时间复杂度与划分的趟数有关。 [4]
 理想的情况是，每次划分所选择的中间数恰好将当前序列几乎等分，经过log2n趟划分，便可得到长度为1的子表。这样，整个算法的时间复杂度为O(nlog2n)。 [4]
 最坏的情况是，每次所选的中间数是当前序列中的最大或最小元素，这使得每次划分所得的子表中一个为空表，另一子表的长度为原表的长度-1。这样，长度为n的数据表的快速排序需要经过n趟划分，使得整个排序算法的时间复杂度为O(n2)
 */
class QuickSort: NSObject {
    func quickSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 { return [] }
        let temp = array[array.count / 2]
        let left = array.filter({$0 < temp})
        let middle = array.filter({$0 == temp})
        let right = array.filter({$0 > temp})
        return quickSort(left) + middle + quickSort(right)
    }
    
    func quickSort1(_ array: [Int]) -> [Int] {
        guard array.count < 1 else { return array }
        let temp = array[array.count/2]
        var left: [Int] = [], middle: [Int] = [], right: [Int] = []
        for num in array {
            if num < temp {
                left.append(num)
            } else if (num == temp) {
                middle.append(num)
            } else {
                right.append(num)
            }
        }
        if left.count == 0 && right.count == 0 {
            return quickSort1(left) + middle + quickSort1(right)
        } else {
            return quickSort1(left) + quickSort1(middle) + quickSort1(right)
        }
    }
    
    /*
     // 示例
     var m = [2,3,5,7,1,4,6,15,5,2,7,9,10,15,9,17,12]
     quickSort(a: &m, low: 0, high: m.count - 1)
     print(m)
     // 结果：[1, 2, 2, 3, 4, 5, 5, 6, 7, 7, 9, 9, 10, 12, 15, 15, 17]
     */
    func quickSort2(nums: inout [Int], low: Int, high: Int) {
        if low >= high { // 递归结束条件
            return
        }
        var i = low
        var j = high
        let key = nums[i]
        while i < j {
            // 从右边开始比较，比key大的数位置不变
            while i < j && nums[j] >= key {
                j -= 1
            }
            // 只要出现一个比key小的数，将这个数放入左边i的位置
            nums[i] = nums[j]
            // 从左边开始比较，比key小的数位置不变
            while i < j && nums[i] <= key {
                i += 1
            }
            // 只要出现一个比key大的数，将这个数放入右边j的位置
            nums[j] = nums[i]
        }
        nums[i] = key // 将key放入i的位置，则左侧数都比key小，右侧数都比key大
        quickSort2(nums: &nums, low: low, high: i - 1) // 左递归
        quickSort2(nums: &nums, low: i + 1, high: high) // 右递归
    }
}
