//
//  IsHappy.swift
//  LeetCode
//
//  Created by 马超 on 2024/5/19.
//
/*
 202. 快乐数 简单
 编写一个算法来判断一个数 n 是不是快乐数。

「快乐数」 定义为：
    对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和。
    然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。
    如果这个过程 结果为 1，那么这个数就是快乐数。
    如果 n 是 快乐数 就返回 true ；不是，则返回 false 。

 示例 1：
 输入：n = 19
 输出：true
 解释：
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 示例 2：
 输入：n = 2
 输出：false
 https://leetcode.cn/problems/happy-number/description/
 */
import Cocoa

class IsHappy: NSObject {
    /*
     题目中说了会 无限循环，那么也就是说求和的过程中，sum会重复出现，这对解题很重要！
     正如：关于哈希表，你该了解这些！中所说，当我们遇到了要快速判断一个元素是否出现集合里的时候，就要考虑哈希法了。
     所以这道题目使用哈希法，来判断这个sum是否重复出现，如果重复了就是return false， 否则一直找到sum为1为止。
     链接：https://leetcode.cn/problems/happy-number/solutions/1007524/dai-ma-sui-xiang-lu-dai-ni-gao-ding-ha-x-sx0j/
     */
    // number 每个位置上的数字的平方和
    func getSum(_ number: Int) -> Int {
        var sum = 0
        var num = number
        while number > 0 {
            let temp = num % 10
            sum += (temp * temp)
            num /= 10
        }
        return sum
    }
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        var num = n
        while true {
            let sum = getSum(num)
            if sum == 1 {
                return true
            }
            // 如果这个sum曾经出现过，说明已经陷入了无限循环
            if set.contains(sum) {
                return false
            } else {
                set.insert(sum)
            }
            num = sum
        }
    }
    
    func isHappy1(_ n: Int) -> Bool {
        var slow = n, fast = n
        while slow != fast {
            slow = getSum(slow)
            fast = getSum(fast)
            fast = getSum(fast)
        }
        return slow == 1
    }
}
