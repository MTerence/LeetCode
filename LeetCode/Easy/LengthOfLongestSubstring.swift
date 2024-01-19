//
//  LengthOfLongestSubstring.swift
//  LeetCode
//
//  Created by Ternence on 2022/3/22.
//

/*
 3. 无重复字符的最长子串
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 https://leetcode.cn/problems/longest-substring-without-repeating-characters/
 https://leetcode.cn/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/
 */

import Cocoa

class LengthOfLongestSubstring: NSObject {
    
    override init() {
        super.init()
        print("\(lengthOfLongestSubstring("abcabcbb"))")
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 { return 0 }
        var string: String = ""
        var maxLength = 0
        
        for c in s {
            if string.contains(c) == false {
                string.append(c)
                maxLength = string.count
            } else {
                while string.contains(c){
                    string.removeFirst()
                }
                string.append(c)
            }
        }
        return maxLength
    }
    
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var curStr = ""
        var maxStr = ""
        
        for c in s {
            while curStr.contains(c) {
                curStr.removeFirst()
            }
            curStr.append(c)
            
            if curStr.count > maxStr.count {
                maxStr = curStr
            }
        }
        
        return maxStr.count
    }
}

extension LengthOfLongestSubstring {
    //"abcabcbb"
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var currentStr = ""
        var maxStr = ""
        for c in s {
            while currentStr.contains(c) {
                currentStr.removeFirst()
            }
            currentStr.append(c)
            if currentStr.count > maxStr.count {
                maxStr = currentStr
            }
        }
        return maxStr.count
    }
}

/*
 https://blog.csdn.net/eereere/article/details/80327857
public class FindMaxArr {
    public static void main(String[] args) {
        int [] arr= {9,10,21,1,2,3,4,5,6,7,3,4,6};
        Arrays.sort(arr);
        System.out.println(arr);
        List list=new ArrayList<>();
        for(int i=0;i temp=new ArrayList<>();
            int j=i+1;
            int val=arr[i];//定义参考的比较值，这个值一直往前移动
        temp.add(arr[i]); for(;jval+1) {
            break;//已经不连续了，退出
            
        } }//end
    if(temp.size()>list.size()) {
        list.clear(); list.addAll(temp);
    }
}//end //输出有序系列 for(Integer i:list) { System.out.println(i); } }}
 */
