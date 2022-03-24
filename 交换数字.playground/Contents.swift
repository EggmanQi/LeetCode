import UIKit

var greeting = "编写一个函数，不用临时变量，直接交换numbers = [a, b]中a与b的值。"

func swapNumbers(_ numbers: [Int]) -> [Int] {
    return solution_3(numbers)
}

print(swapNumbers([1,10]))

func solution_3(_ numbers: [Int]) -> [Int] {
    /**
     位运算（异或运算）
     时间复杂度：O(1)
     空间复杂度：O(0)
     执行用时： 0 ms >100%
     内存消耗： 13.7 MB >84.62%
     */
    
    var result = numbers
    
    result[0] ^= result[1]
    result[1] ^= result[0]
    result[0] ^= result[1]
    
    return result
}

func solution_2(_ numbers: [Int]) -> [Int] {
    /**
     差值切换，用加法需要考虑 Int 极值问题
     时间复杂度：O(1)
     空间复杂度：O(0)
     执行用时： 4 ms >69.23%
     内存消耗： 13.9 MB >38.46%
     */
    
    var result = numbers
    
    result[0] = result[0] - result[1]
    result[1] = result[1] + result[0]
    result[0] = result[1] - result[0]
    
    return result
}

func solution_1(_ numbers: [Int]) -> [Int] {
    /**
     API 大法
     时间复杂度：O(1)
     空间复杂度：O(0)
     执行用时： 4 ms >69.23%
     内存消耗： 13.7 MB >69.23%
     */
    return numbers.reversed()
}
