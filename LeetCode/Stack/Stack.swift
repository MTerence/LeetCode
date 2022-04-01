//
//  Stack.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/30.
//

import Cocoa

protocol Stack {
    associatedtype Element
    var isEmpty: Bool { get }
    var size: Int { get }
    var peek: Element? { get }
    func push(_ element: Element) -> Bool
    func pop() -> Element?
}

