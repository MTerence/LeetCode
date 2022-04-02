//
//  ArrayQueue.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/2.
//

import Cocoa

class ArrayQueue: NSObject {
    private var array = [Int]()
    
    func push(_ x: Int) {
        array.append(x)
    }
    
    func pop() -> Int? {
        guard size() > 0 else { return nil }
        return array.removeFirst()
    }
    
    func size() -> Int {
        return array.count
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}
