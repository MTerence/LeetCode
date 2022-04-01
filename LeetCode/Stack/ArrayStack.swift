//
//  ArrayStack.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/31.
//

import Cocoa

class ArrayStack<Element> {
    typealias Element = Element
    
    private var items = [Element]() //数组
    private var count = 0   //栈中元素个数
    private var n     = 0   //栈的大小
    
    init(_ n: Int) {
        self.n = n
        self.count = 0
    }
    
    var isEmpty: Bool {
        return items.count == 0
    }
    
    var size: Int {
        return items.count
    }
    
    func push(_ element: Element) -> Bool {
        if count == n { return false }
        items[count] = element
        count += 1
        return true
    }
    
    func pop() -> Element? {
        if count == 0 { return nil }
        let element = items[count]
        count -= 1
        return element
    }
}
