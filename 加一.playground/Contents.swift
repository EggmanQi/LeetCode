import UIKit

//给定一个非负整数组成的非空数组，在该数的基础上加一，返回一个新的数组。
//
//最高位数字存放在数组的首位，数组中每个元素只存储一个数字。
//
//你可以假设除了整数 0 之外，这个整数不会以零开头。
//
//      题目描述有问题, 给出的测试用例有 [0] 这种情况, 且 [10] 不算一个数字, 需要拆分成 [1,0]
//      同理, [9,9,9] 的期望结果是 [1,0,0,0]
//      简而言之, 这是一个支持 10进制 的数组换算方法


func plusOne(_ digits: [Int]) -> [Int] {
    
    if errorHandle(digits) {
        return digits
    }
    
//    return sulotion_2(digits)     // 20+ ms
    return sulotion_3(digits)
}

// 这个方法会 int 长度超出
func sulotion_1(_ digits: [Int]) -> [Int] {
    
    var site = 1
    var index = 0
    var result = 0
    
    for num in digits.reversed() {
        
        print(num, result, index, site, separator: ", ")
        
        if index==0 {
            result = result + num
        }else {
            result = result + num * site
        }
        index = index + 1
        site = site * 10
    }
    
    print("result:" , result)
    
    result = result + 1
    
    var final:[Int] = []
    for _ in 0..<index {
        site = site/10
        
        let num = result / site
        
        final.append(num)
        
        result = result - num*site
    }
    
    return final
}

func sulotion_2(_ digits: [Int]) -> [Int] {
    
    var digits = digits
    
    for i in (0..<digits.count).reversed() {
        if digits[i] < 9 {
            digits[i] += 1
            return digits
        }
        
        digits[i] = 0
    }
    
    digits.insert(1, at: 0)
    
    return digits
}

func sulotion_3(_ digits: [Int]) -> [Int] {

    var digits = digits
    
    var carray = 1
    for i in (0..<digits.count).reversed() {
        let sum = digits[i] + carray

        digits[i] = sum % 10
        carray = sum / 10

        if carray == 0 {
            return digits
        }
    }

    digits.insert(1, at: 0)
    return digits
}

func errorHandle(_ digits: [Int]) -> Bool {
    
    if digits.isEmpty {
        return true
    }
    
    return false
}

print(plusOne([9,9,9,9]))
