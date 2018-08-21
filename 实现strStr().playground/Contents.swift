import UIKit

var str = "给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。"

func strStr(_ haystack: String, _ needle: String) -> Int {
    
    solution_1(haystack, needle)
    return solution_2(haystack, needle)
    
}

//4388 ms
func solution_1(_ haystack: String, _ needle: String) -> Int {
    if needle.count==0 || haystack==needle {
        return 0
    }
    
    if haystack.count<needle.count || haystack.count==0 {
        return -1
    }
    
    let char_h = haystack.utf8CString
    let char_n = needle.utf8CString
    
    for i in 0...(haystack.count-needle.count) {
        if char_h[i] == char_n[0] {
            for j in 0..<needle.count {
                if char_h[i+j] != char_n[j] {
                    break
                }else if j==needle.count-1 {
                    return i
                }
            }
        }
    }
    
    return -1
}

//12ms
func solution_2(_ haystack: String, _ needle: String) -> Int {
    let count1 = haystack.count
    let count2 = needle.count
    if count2 == 0 {
        return 0
    }
    
    if count1 < count2 {
        return -1
    }
    
    var haystackChars = haystack.cString(using: .utf8)!
    var needleChars = needle.cString(using: .utf8)!
    var i = 0
    var j = 0
    
    let maxi = count1 - count2
    let maxj = count2 - 1
    
    while i <= maxi && j <= maxj {
        var m = i
        while m <= count1 - 1 && j <= maxj {
            let mv = haystackChars[m]
            let jv = needleChars[j]
            if mv == jv {
                m += 1
                j += 1
                continue
            }
            j = 0
            i += 1
            break
        }
    }
    j -= 1
    if j == maxj{
        return i
    }
    
    return -1
}

//print(strStr("hello", "llo"))
print(strStr("mississippi", "ssip"))

