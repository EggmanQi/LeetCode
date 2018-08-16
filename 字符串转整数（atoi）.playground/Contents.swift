import UIKit

var str = "Hello, playground"

func myAtoi(_ str: String) -> Int {
    
    return solution_1(str)
}

func end(_ result: String, _ isNegative: Int) -> Int {
    
    if result.count==0 {
        return 0
    }
    
    if Int(result)==nil {
        return Int(isNegative == -1 ? Int32.min : Int32.max)
    }else {
        if Int(result)! > Int32.max {
            return Int(isNegative == -1 ? Int32.min : Int32.max)
        }else {
            return Int(isNegative == -1 ? ("-" + result) : result)!
        }
    }
}

// 第一次完成时的代码
func solution_1(_ s: String) -> Int {
    var result = ""
    var isNegative = 0 // -1:负数, 1:正数
    
    for character in str.unicodeScalars {
        
        let code = Int(character.value)
        
        if code==32 { // 空格
            if result.count>0 {
                return end(result, isNegative)
            }
            if isNegative != 0 {
                return end(result, isNegative)
            }
            continue
        }
        
        if code==43 { // +
            if result.count == 0 && isNegative==0 {
                isNegative = 1
                continue
            }else{
                return end(result, isNegative)
            }
        }
        
        if code==45 { // -
            if result.count == 0 && isNegative==0{
                isNegative = -1
                continue
            }else{
                return end(result, isNegative)
            }
        }
        
        if code==48 {
            if result.count==0 || result=="0"{
                result = "0"
                continue
            }else {
                result = result+String(character)
                continue
            }
        }
        
        if code>48 && code<58 {
            if result=="0" {
                result = ""
            }
            result = result+String(character)
        }else {
            return end(result, isNegative)
        }
    }
    
    return end(result, isNegative)
}


// 不明白 result/10 的意义
func solution_demo(_ str: String) -> Int {
    if str.isEmpty {
        return 0
    }
    
    let ＋: Int8 = 43
    let －: Int8 = 45
    let ascii0: Int8 = 48
    let ascii9: Int8 = 57
    let space: Int8 = 32

    var sign: Int = 1
    
    var result: Int = 0
    
    let chars = str.utf8CString
    
    print(chars)
    
    var i: Int = 0
    
    // 如果前边是空格, 跳过下标
    while chars[i] == space {
        i += 1
    }
    
    // 如果前边是 + - 符号, 记录并跳过下标
    if chars[i] == ＋ || chars[i] == － {
        sign = chars[i] == － ? -1 : 1
        i += 1
    }
    
    // 开始遍历
    while i < chars.count - 1, ascii0...ascii9 ~= chars[i] {
        
        print(i, chars[i], chars[i] - ascii0, result, Int32.max, separator: ",")
        
        // result每次遍历都增一位, 所以可以通过比较 Int32.max/10 来提前判断是否越位
        // 第二个条件判断意思是, result只与Int32.max 只差1位不同, 判断最后一位是大于7, Int32.max = 2147483647
        if result > Int32.max / 10 || (result == Int32.max / 10 && Int(chars[i] - ascii0) > 7) {
            return sign == 1 ? Int(Int32.max) : Int(Int32.min)
        }
        
        // 数字asc2码减去0的asc2码, 得到该数字
        result = result * 10 +  Int(chars[i] - ascii0)
        i += 1
    }
    
    return result * sign
}


//print(myAtoi("-   234"))
//print(myAtoi("    +0 42"))
//print(myAtoi("42"))
//print(myAtoi("+1"))
//print(myAtoi("+-2"))
//print(myAtoi("3.1415926"))
//print(myAtoi("9223372036854775808"))
//print(myAtoi("20000000000000000000"))
//print(myAtoi("-000000000000000000000000000000000000000000000000001"))
//print(myAtoi("     +004500"))
//print(myAtoi("     +0 123"))
//print(myAtoi("-91283472332"))
print(solution_demo("42"))
//print(solution_demo("-91283472332"))
