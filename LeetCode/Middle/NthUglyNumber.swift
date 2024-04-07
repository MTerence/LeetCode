//
//  NthUglyNumber.swift
//  LeetCode
//
//  Created by Ternence on 2022/5/16.
//

/*
 264. 丑数 II
 给你一个整数 n ，请你找出并返回第 n 个 丑数 。
 丑数 就是只包含质因数 2、3 和/或 5 的正整数。
 示例 1：
 输入：n = 10
 输出：12
 解释：[1, 2, 3, 4, 5, 6, 8, 9, 10, 12] 是由前 10 个丑数组成的序列。
 
 示例 2：
 输入：n = 1
 输出：1
 解释：1 通常被视为丑数。
 https://leetcode.cn/problems/ugly-number-ii/
 https://leetcode.cn/problems/chou-shu-lcof/
 */
import Cocoa

class NthUglyNumber: NSObject {
    //丑数 就是只包含质因数 2、3 和 5 的正整数。， 所以 当前的丑数 必然是前面的丑数想乘得到的结果。如果我们能拿到之前的丑数 然后 分别 乘以 2、3、5 就能得到新的丑数了。https://leetcode.cn/problems/ugly-number-ii/solutions/985971/264-chou-shu-ii-by-duanyutian-g1ar/
    func nthUglyNumber(_ n: Int) -> Int {
        var a = 0, b = 0, c = 0
        var dp: [Int] = [1]
        for i in 1..<n {
            let min = min(min(dp[a] * 2, dp[b] * 3), dp[c] * 5)
            if dp[i] == a { a += 1 }
            if dp[i] == b { b += 1 }
            if dp[i] == c { c += 1 }
        }
        return dp[n-1]
    }
}
