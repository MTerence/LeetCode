//
//  QuickSort.swift
//  LeetCode
//
//  Created by 马超 on 2024/1/17.
//

import Cocoa

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
}
