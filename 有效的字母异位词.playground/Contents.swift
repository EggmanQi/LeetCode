import UIKit

var str = "给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。"

// 条件:
// 1. 长度一致
// 2. 出现的字母一致, 次数一致


/// 我的提交执行用时
/// 已经战胜 100.00 % 的 swift 提交记录
/// 嘿嘿嘿

func isAnagram(_ s: String, _ t: String) -> Bool {
    
    if s.count != t.count {
        return false
    }
    
    var arr_s = Array<Int>(repeating: 0, count: 26)
    var arr_t = Array<Int>(repeating: 0, count: 26)
    
    for character in s.unicodeScalars {
        let index = Int(character.value - 97)
        arr_s[index] = arr_s[index] + 1
    }
    
    for character in t.unicodeScalars {
        let index = Int(character.value - 97)
        arr_t[index] = arr_t[index] + 1
    }
    
    if arr_s != arr_t {
        return false
    }
    
    return true
}

print(isAnagram("anagram", "nagaram"));


