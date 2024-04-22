//
//  MinDupSubstring.swift
//  LeetCode
//
//  Created by 马超 on 2024/4/7.
//

/*
 最短重复子串
 */
import Cocoa

class MinDupSubstring: NSObject {
    
    override init() {
        super.init()
        let res = minDupSubstring("abcabab")
        print("查找最短子字符串:\(res)")
    }
    
    //ababab ab
    //ababcabc ab
    func minDupSubstring(_ s: String) -> String {
        let len = s.count
        var res: String = ""
        for i in 1 ..< len { //假设子串的长度是i
            print("查找最短子字符串:\(i)")
            if len % i != 0 { //如果i是原串长度的因数才继续往下寻找
                continue
            }
            var flag = 0
            for j in 0 ..< i {
                var index = j
                while index < len {
                    if s.char(at: index) != s.char(at: j) {
                        flag = 1
                        break
                    }
                    index += i
                }
                if flag == 1 { break }
            }
            
            if flag == 0 {//完全匹配完成
                for indexJ in 0 ..< i {
                    res.append(s.char(at: indexJ))
                }
                return res
            }
        }
        return s
    }
}

/*
string gcd(string s){
    int len = s.length();
    for(int i=1;i<=len;i++){//假设子串的长度是i
        int flag = 0;
        if(len%i==0){//如果i是原串长度的因数才继续往下寻找
            for(int j=0;j<i;j++){//匹配i次
                int wei = j;
                while(wei<len){
                    if(s[wei]!=s[j]){
                        flag = 1;
                        break;
                    }
                    wei+=i;
                }
                if(flag) break;
            }
            if(flag==0){//完全匹配完成
                string ans;
                for(int j=0;j<i;j++){
                    ans += s[j];
                }
                return ans;
            }
        }
    }
    return s;
}
*/
