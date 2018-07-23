import UIKit

var str = "给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。"

// 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

func singleNumber(_ nums: [Int]) -> Int {
    
//    return answer_1(nums)
    return answer_2(nums)
}

// 请求空间->排序->找出3个数字中2个i相同一个不同的组合->处理不同数字在 first 或 last 的情况
func answer_1 (_ nums: [Int]) -> Int {
    
    if nums.count<2 {
        return nums.first!
    }
    
    var arr:Array<Int> = []
    for i in nums {
        arr.append(i)
    }
    
    arr.sort()
    
    for i in 1..<(arr.count-1)
    {
        let a = arr[i-1]
        let b = arr[i]
        let c = arr[i+1]
        
        if a != b {
            if b != c {
                return b
            }else {
                if i==1 {
                    return a
                }
            }
        }else {
            if b != c {
                if i==arr.count-2 {
                    return c
                }
            }
        }
    }
    
    
    return 0;
}

// 异或操作: 不太明白, res的值遇到新值会叠加新值, 遇到旧值会减去旧值, 所以会剩下不重复的值
// 不能解决多个重复3次的值或只重复两次的值
func answer_2 (_ nums: [Int]) -> Int {
    
    if nums.count<2 {
        return nums.first!
    }
    
    var res = 0
    for i in nums {
        print("i: ", i)
        res ^= i
        print("    res: ",res)
    }
    
    return res
}

// 使用 dic 的方案, 但空间复杂度与时间复杂度都不低
func answer_3 (_ nums: [Int]) -> Int {
    
    if nums.count<2 {
        return nums.first!
    }
    
    // 使用 dictionary, 结构为[值:次数]
    // 遍历 nums, 记录数字的出现次数
    // 遍历 dictionary, 找出次数为1的值
    
    
    return 0
}

print(singleNumber([1,2,4,3,2,1,3]))
