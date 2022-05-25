//
//  SingleNumber.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/25.
//

import Cocoa

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

}
