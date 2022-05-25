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
    
    func substr(_ start: Int, length: UInt? = nil) -> String? {
        if abs(start) > count { return nil }
        let offset = (start >= 0) ? start : count+start
        
        let start = self.index(startIndex, offsetBy: start)
        guard let length = length else {
            // length==nil,直接截取到字符串结尾
            return String(self[start...]) }
        
        let end = self.index(startIndex, offsetBy: min(offset+Int(length), count))
        return String(self[start..<end])
    }
    
    func subStr(start index: Int, length: Int) -> String? {
        guard let startIndex = self.index(self.startIndex, offsetBy: index, limitedBy: self.endIndex),
              let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) else { return nil }
        return String(self[startIndex..<endIndex])
    }
}
