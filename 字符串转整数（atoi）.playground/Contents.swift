import UIKit

var str = "将字符串转换成一个 32 位有符号整数（类似 C/C++ 中的 atoi 函数）"
/**
 读入字符串并丢弃无用的前导空格
 检查下一个字符（假设还未到字符末尾）为正还是负号，读取该字符（如果有）。 确定最终结果是负数还是正数。 如果两者都不存在，则假定结果为正。
 读入下一个字符，直到到达下一个非数字字符或到达输入的结尾。字符串的其余部分将被忽略。
 将前面步骤读入的这些数字转换为整数（即，"123" -> 123， "0032" -> 32）。如果没有读入数字，则整数为 0 。必要时更改符号（从步骤 2 开始）。
 如果整数数超过 32 位有符号整数范围 [−231,  231 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −2的 31 次方 的整数应该被固定为 −2的 31 次方 ，大于 2的 31 次方 − 1 的整数应该被固定为 2的 31 次方 − 1 。
 返回整数作为最终结果。
 */

/**
 先判断是否符号或数字, 如是非空格/非符号/非数字 即停止
 再判断是否数字, 是即开始只判断是否数字
 数字后有非数字即停止
 */

func myAtoi(_ str: String) -> Int {
    
    return solve_2022_part2(str)
}

func solve_2022_part2(_ str: String) -> Int {
/**
 执行用时：8 ms, 在所有 Swift 提交中击败了 73.68% 的用户
 内存消耗：14 MB, 在所有 Swift 提交中击败了 41.05% 的用户
 */
	let chars = str.map{$0}
	var idx = 0
	// 起始下标过掉前导空格
	while (idx<chars.count && chars[idx] == " ") {
		idx+=1;
	}
	if (idx == chars.count) {
		return 0
	}
		
	// 问题不严谨, 多个 "+" "-" 时描述模糊
	var negative = false
	if chars[idx] == "+" {
		negative = false
		idx += 1
	}else if chars[idx] == "-" {
		negative = true
		idx += 1
	}
		
	var ans = 0
	while (idx < chars.count && chars[idx] >= "0" && chars[idx] <= "9") {
		let digit:Int32 = Int32(chars[idx].wholeNumberValue ?? 0) // 注意注释, 能识别特殊字符的数字
		if (ans > (Int32.max - digit)/10) {
			// ans*10 + digit > Int.max
			return Int(negative ? Int32.min : Int32.max)
		}
		
		ans = ans*10 + Int(digit)
		idx += 1
	}
	
	return negative ? ans*(-1) : ans;
}


print(myAtoi("20000000000000000000"))
print(myAtoi(".1"))
print(myAtoi("00000-42"))
print(myAtoi("021474836460"))
print(myAtoi("-91283472332"))

//MARK: 不能用懒人思路做全字符串遍历, 全遍历不能规避越界问题, 必须边遍历边判断
func solve_2022(_ str: String) -> Int {
	let mark_zheng = "+"
	let mark_fu = "-"
	let nums_start = "123456789"
	let nums_end = "0123456789"
	let chars = "qwertyuiopasdfghjklzxcvbnm"
	let space = " "
	
	var finalStr = ""
	var isZheng = 0
	
	for (_, value) in str.enumerated() {
		if space.range(of: String(value)) != nil {
			if finalStr.count>0 {
				break
			}else {
				continue
			}
		}
		
		if mark_zheng.range(of: String(value)) != nil {
			if finalStr.count > 0 {
				break
			}
			
			if isZheng==0 {
				isZheng = 1
			}else {
				break
			}
			continue
		}
		
		if mark_fu.range(of: String(value)) != nil {
			if finalStr.count > 0 {
				break
			}
			
			if isZheng==0 {
				isZheng = -1
			}else {
				break
			}
			continue
		}
		
		if finalStr.count == 0 {
			if "0".range(of: String(value)) != nil {
				finalStr.append(value)
				continue
			}else if nums_start.range(of: String(value)) != nil {
				finalStr.append(value)
				continue
			}else {
				if nums_end.range(of: String(value)) != nil {
					continue
				}else {
					break
				}
			}
		}else {
			if nums_end.range(of: String(value)) != nil {
				finalStr.append(value)
				continue
			}else {
				break
			}
		}
	}
	
	
	if finalStr.count == 0 {
		return 0
	}else {
		var result = Int(finalStr)!
		if isZheng < 0 {
			result = result * -1
		}
		if result < Int32.min  {
			return Int(Int32.min)
		}else if (result > (Int32.max)) {
			return Int((Int32.max))
		}else {
			return result
		}
	}
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
	
	/**
	 执行用时：8 ms, 在所有 Swift 提交中击败了 73.68% 的用户
	 内存消耗：13.5 MB, 在所有 Swift 提交中击败了 99.47% 的用户
	 */
	
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
//print(solution_demo("42"))
//print(solution_demo("-91283472332"))
