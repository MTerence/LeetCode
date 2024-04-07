//
//  Stack2Queue.swift
//  LeetCode
//
//  Created by 马超 on 2024/3/25.
//

/* 用两个栈实现一个线程安全的队列，需要实现队列的push、pop、empty方法*/
import Foundation

class Stack2Queue<Element> {
    typealias Element = Element
    var stack1: [Element] = []
    var stack2: [Element] = []
    let lock = NSLock()
    
    func push(_ element: Element) {
        lock.lock()
        defer {
            lock.unlock()
        }
        stack1.append(element)
    }
    
    func pop() -> Element? {
        lock.lock()
        defer {
            lock.unlock()
        }
        guard !isEmpty() else {
            return nil
        }
        for item in stack1 {
            stack2.append(item)
        }
        return stack2.popLast()
    }
    
    func isEmpty() -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return stack1.isEmpty
    }
}
