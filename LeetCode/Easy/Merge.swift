//
//  Merge.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//

import Cocoa
/*
 88. 合并两个有序数组
 给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。

 请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。

 注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。
 示例 1：
 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 输出：[1,2,2,3,5,6]
 解释：需要合并 [1,2,3] 和 [2,5,6] 。
 合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。
 https://leetcode-cn.com/problems/merge-sorted-array/
 */

class Merge: NSObject {
    // 方式1：将数组2合入到数组1后，对数组1进行合并
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1 = Array(nums1.prefix(m))
        nums1.append(contentsOf: nums2)
        nums1.sort()
    }
    
    // 方式2：逆向双指针
    func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var cur = m + n - 1
        while p1 >= 0 && p2 >= 0 {
            if nums1[p1] < nums2[p2] {
                nums1[cur] = nums2[p2]
                p2 -= 1
            } else {
                nums1[cur] = nums1[p1]
                p1 -= 1
            }
            cur -= 1
        }
        
        while p2 >= 0 {
            nums1[cur] = nums2[p2]
            p2 -= 1
            cur -= 1
        }
    }
    
    /*方式2：逆向双指针
    由于nums1的后半部分是空的，可以直接覆盖而不会影响结果。因此可以指针设置为从后向前遍历，每次取两者之中的较大者放进nums1的最后面。
    1. 设置双指针 i 和 j ， 分别指向有序数组nums1和nums2的最后一位
    2. 利用这两个指针从后向前分别遍历两个有序数组
        终止条件：两个指针都不再指向数组
        比较双指针指向的值nums1[i] 和 nums2[j]的大小
        大的移动到 nums1 空间的尾部( 从后向前依次填充 ), 对应的指针向前移动一位
        当 j 已经不指向数组，但是i还有效，说明nums2已经遍历结束，指针 i 向前移动一位，其他什么都不需要做
        重复上面步骤
     https://leetcode.cn/problems/merge-sorted-array/solutions/2075448/suan-fa-dong-hua-he-bing-liang-ge-you-xu-2c0g/
     */
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1
        while i >= 0 || j >= 0 {
            if j < 0 || (i > 0 && nums1[i] > nums2[j]) { //nums2指向的元素更小
                nums1[i+j+1] = nums1[i]
                i -= 1
            } else {    //nums1指向的元素更小
                nums1[i+j+1] = nums2[j]
                j -= 1
            }
        }
    }
    
    // 方式3 其实就是归并排序的合并过程
    // https://leetcode.cn/problems/merge-sorted-array/solutions/1397742/by-kaijiemu-6mlz/?envType=study-plan-v2&envId=top-interview-150
    func merge3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1   // nums1的右坐标
        var j = n - 1   // nums2的右坐标
        var cur = m + n - 1 // 从最右边开始存放数据
        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[cur] = nums1[i]
                i -= 1
                cur -= 1
            } else {
                nums1[i] = nums2[j]
                j -= 1
                cur -= 1
            }
        }
    }
}
