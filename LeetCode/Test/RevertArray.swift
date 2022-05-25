//
//  RevertArray.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/25.
//

/*
 字节 - 星图二面
 */
import Cocoa

class RevertArray: NSObject {
    override init() {
        super.init()
        var array = [1, 2, 3, 4, 5]
        revertArray(&array)
        print("revertedArray =\(array)")
    }
    
    func revertArray(_ array: inout [Int]) {
        if array.count < 2 { return }
        var left = 0
        var right = array.count - 1
        while left < right {
            let lValue = array[left]
            array[left] = array[right]
            array[right] = lValue
            left  += 1
            right -= 1
        }
    }
}
