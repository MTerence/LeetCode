//
//  String+Extension.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/28.
//

extension String {
    func char(at position: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: position)
        return self[index]
    }
}
