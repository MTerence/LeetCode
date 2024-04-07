//
//  CheckInclusion.swift
//  LeetCode
//
//  Created by 马超 on 2024/1/17.
//

/*
 LCR 014. 字符串的排列 中等
 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的某个变位词。
 换句话说，第一个字符串的排列之一是第二个字符串的 子串 。

 示例 1：
 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
 示例 2：
 输入: s1= "ab" s2 = "eidboaoo"
 输出: False

 提示：
 1 <= s1.length, s2.length <= 104
 s1 和 s2 仅包含小写字母
 注意：本题与主站 567 题相同： https://leetcode-cn.com/problems/permutation-in-string/
 
 解题思路
 最终判断是否存在的条件是—— window 字典和 need 字典是否相等，相等则说明存在异位词。
 用这个更方便，因为不用维护 match 变量，滑动窗口扩张的时候不需要怎么操作，超出了长度，收缩的时候再判断就行了

 代码
 class Solution {
     func checkInclusion(_ s1: String, _ s2: String) -> Bool {
         // 滑动窗口
         // 先计算 s1 中每个字符的出现次数
         
         var need:[Character:Int] = [:]
         for i in s1 {
             // 默认值
             need[i] = (need[i] ?? 0) + 1
         }

         var window:[Character:Int] = [:]

         let stringArray = Array(s2)
         for i in 0..<stringArray.count {
             let c = stringArray[i]
             window[c] = (window[c] ?? 0) + 1

             // 窗口到达了 s1 的长度就开始收缩
             if i >= s1.count {
                 let L = i - s1.count // 左侧坐标
                 let deleteC = stringArray[L]
                 if window[deleteC]! == 1 {
                     window.removeValue(forKey: deleteC)
                 } else {
                     window[deleteC] = window[deleteC]! - 1
                 }
             }
             if window == need {
                 return true
             }
         }

         return false
     }
 }

 作者：HuaiGuangPan
 链接：https://leetcode.cn/problems/MPnaiL/solutions/2000156/by-huaiguangpan-21sl/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
import Cocoa

class CheckInclusion: NSObject {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // 滑动窗口
        // 先计算 s1 中每个字符的出现次数
        var need:[Character:Int] = [:]
        for i in s1 {
            // 默认值
            need[i] = (need[i] ?? 0) + 1
        }

        var window:[Character:Int] = [:]

        let stringArray = Array(s2)
        for i in 0..<stringArray.count {
            let c = stringArray[i]
            window[c] = (window[c] ?? 0) + 1

            // 窗口到达了 s1 的长度就开始收缩
            if i >= s1.count {
                let L = i - s1.count // 左侧坐标
                let deleteC = stringArray[L]
                if window[deleteC]! == 1 {
                    window.removeValue(forKey: deleteC)
                } else {
                    window[deleteC] = window[deleteC]! - 1
                }
            }
            if window == need {
                return true
            }
        }

        return false
    }
}
