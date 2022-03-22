//
//  Example2.swift
//  算法
//
//  Created by Ternence on 2021/5/27.
//

import Cocoa

class Example2: NSObject {
    override init() {
        super.init()
        
        
        print("\(quickSort([2, 1, 5, 3, 9, 6, 7, 4, 5]))")
        print("\(quickSort1([2, 1, 5, 3, 9, 6, 7, 4, 5]))")
        print("\(chooseSort([2, 1, 5, 3, 9, 6, 7, 4, 5]))")
        print("\(binarySearch([1, 2, 3, 4, 6, 8, 9], target: 4))")
    }
    
    //快速排序
    func quickSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        let temp = array[array.count / 2 ]
        let left = array.filter{$0 < temp}
        let middle = array.filter{$0 == temp}
        let right = array.filter{$0 > temp}
        
        return quickSort(left) + middle + quickSort(right)
    }
    
    func quickSort1(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let temp = array[array.count/2]
        
        var left: [Int] = [], middle: [Int] = [], right: [Int] = []
        
        for obj in array {
            if obj < temp {
                left.append(obj)
            } else if obj == temp {
                middle.append(obj)
            } else {
                right.append(obj)
            }
        }
        
        if left.count == 0 && right.count == 0 {
            return quickSort1(left) + middle + quickSort1(right)
        } else {
            return quickSort1(left) + quickSort1(middle) + quickSort1(right)
        }
    }
    
    
    func chooseSort(_ inputNums:[Int]) -> [Int] {
        var nums:[Int] = inputNums
        guard nums.count > 1 else { return nums }
        
        for (i, num) in nums.enumerated() {
            var min = i
            for j in i + 1 ..< nums.count {
                if num > nums[j] {
                    min = j
                }
            }
            
            if min != i {
                let t = nums[i]
                nums[min] = nums[i]
                nums[i] = t
            }
        }
        return nums
    }
    
    // 二分法查找有序数组中是否包含数字x, [1, 2, 3, 4, 6, 8, 9] 4 -> true
    func binarySearch(_ nums: [Int], target: Int) -> Bool {
        var left = 0, middle = 0, right = nums.count - 1
        while left <= right {
            middle = (right - left) / 2 + left
            
            if nums[middle] == target {
                return true
            } else if nums[middle] < target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return false
    }
    
    /*
    func reverseList(headNode: ListNode) -> ListNode {
        
        guard let headNext = headNode.next else { return headNode }
        var head = headNode
        var p:ListNode = head, q:ListNode = headNext, r:ListNode
        head.next = nil
        while q != nil {
            r = q.next
            q.next = p
            p = q
            q = r
        }
        head = p
        
        return head
    }
    
*/
    

}
