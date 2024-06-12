//
//  FindClosestElements.swift
//  LeetCode
//
//  Created by 马超 on 2024/2/26.
//
/*
 658. 找到 K 个最接近的元素 中等
 给定一个 排序好 的数组 arr ，两个整数 k 和 x ，从数组中找到最靠近 x（两数之差最小）的 k 个数。返回的结果必须要是按升序排好的。
 整数 a 比整数 b 更接近 x 需要满足：
 |a - x| < |b - x| 或者
 |a - x| == |b - x| 且 a < b
  

 示例 1：
 输入：arr = [1,2,3,4,5], k = 4, x = 3
 输出：[1,2,3,4]
 示例 2：
 输入：arr = [1,2,3,4,5], k = 4, x = -1
 输出：[1,2,3,4]
 https://leetcode.cn/problems/find-k-closest-elements/description/
 */
import Cocoa

class FindClosestElements: NSObject {
    // 思路
    // 1. 双指针碰撞的方式，排除法，排除 size-k 个大的元素，剩下 k个最接近的元素；
    // 2. 二分查找靠近元素的最左区间，找到后从左区间加K的数，就是最靠近的元素
    // 时间复杂度:
    // O(log(n−k)+k)

    // 空间复杂度:
    // O(1)
    // https://leetcode.cn/problems/find-k-closest-elements/solutions/2622597/zhao-dao-k-ge-zui-jie-jin-de-yuan-su-by-qa1xv/
    // 1. 双指针，排除法：一个一个删，因为数组有序，且返回的是连续升序子数组，留下差值相对较小的值
    func findClosestElements1(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - 1
        //要移除的数量
        var removeNums = arr.count - k
        while removeNums > 0 {
            // 移除条件
            if x - arr[left] <= arr[right] - x {
                // 此时left是相对靠近的数
                right -= 1
            } else {
                // 此时right是相对靠近的数
                left += 1
            }
            removeNums -= 1
        }
        var res: [Int] = []
        for i in left..<left+k {
            res.append(arr[i])
        }
        return res
    }
    
    // 2. 二分查找最优区间的左边界
    func findClosestElements2(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        while left < right {
            var mid = (left + right) / 2
            // 尝试从长度为 k + 1 的连续子区间删除一个元素
            // 从而定位左区间端点的边界值
            if x - arr[mid] > arr[mid+k] - x {
                // 下一轮搜索区间是 [mid + 1..right]
                left = mid + 1
            } else { 
                // 下一轮搜索区间是 [left..mid]
                right = mid
            }
        }
        var res: [Int] = []
        for i in left..<left+k {
            res.append(arr[i])
        }
        return res
    }

}
