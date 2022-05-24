//
//  MyStack.swift
//  LeetCode
//
//  Created by Ternence on 2022/4/2.
//

/*
 225. 用队列实现栈
 请你仅使用两个队列实现一个后入先出（LIFO）的栈，并支持普通栈的全部四种操作（push、top、pop 和 empty）。
 实现 MyStack 类：

 void push(int x) 将元素 x 压入栈顶。
 int pop() 移除并返回栈顶元素。
 int top() 返回栈顶元素。
 boolean empty() 如果栈是空的，返回 true ；否则，返回 false 。

 注意：
 你只能使用队列的基本操作 —— 也就是 push to back、peek/pop from front、size 和 is empty 这些操作。
 你所使用的语言也许不支持队列。 你可以使用 list （列表）或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
  
 示例：
 输入：
 ["MyStack", "push", "push", "top", "pop", "empty"]
 [[], [1], [2], [], [], []]
 输出：
 [null, null, null, 2, 2, false]

 解释：
 MyStack myStack = new MyStack();
 myStack.push(1);
 myStack.push(2);
 myStack.top(); // 返回 2
 myStack.pop(); // 返回 2
 myStack.empty(); // 返回 False
 https://leetcode-cn.com/problems/implement-stack-using-queues/
 */

import Cocoa

class MyStack<Element> {
    typealias Element = Element
    
    private var queue = [Element]()
    
    func push(_ x: Element) {
        queue.append(x)
    }
    
    func pop() -> Element {
        queue.removeFirst()
    }
    
    func top() -> Element {
        return queue.first!
    }
    
    func peek() -> Element {
        return queue.last!
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}

class QueueStack: NSObject {
    private var mainQueue = ArrayQueue()
    
    func push(_ x: Int) {
        mainQueue.push(x)
    }
    
    func pop() -> Int {
       return mainQueue.pop()!
    }
    
    func top() -> Int {
        let top = mainQueue.pop()!
        mainQueue.push(top)
        return top
    }
    
    func empty() -> Bool {
        return mainQueue.isEmpty()
    }
}
