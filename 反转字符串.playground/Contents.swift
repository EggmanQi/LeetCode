import UIKit

var str = "编写一个函数，其作用是将输入的字符串反转过来。"

func reverseString(_ s: String) -> String {
    
    if s.count<1 {
        return s
    }
    
    return solution_1(s)
}

func solution_1(_ s: String) -> String {
    return String(Array(s).reversed())
}

print(reverseString(str))

