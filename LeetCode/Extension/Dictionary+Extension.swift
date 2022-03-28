//
//  Dictionary+Extension.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/28.
//

import Foundation

extension Dictionary where Value: Equatable {
    func getKey(forValue val: Value) -> Key? {
        return first(where: {$0.value == val})?.key
    }
}
