//: Playground - noun: a place where people can play

import UIKit

var question = "给定一个 integer 的数组，返回两个能够求和得到目标值的下标。"
var condition = "必须保证只有一个结果，并且不能两次使用相同元素"

func towSum(_ nums:[Int], _ target:Int)->[Int]{
    
    if nums.count<2 {
        return []
    }
    
    if nums.count==2 {
        if nums[0]+nums[1]==target{
            return [0, 1]
        }
        else{
            return []
        }
    }
    
    var temArr:[Int] = nums
    
    for index in 0..<nums.count {

        var left = temArr[index]
        var right = 0
        
        for num in index..<temArr.count-1 {

            right = temArr[num+1]
            
            if left + right == target {
                return [index, num+1]
            }
            
            if num == temArr.count-1 {
                return []
            }
        }
        
    }
    
    return []
}

print(towSum([3,2,4], 6))
print("上面的答案 leetcode 用了 1892ms 运行了 19个 test case")


print("标准答案")

func answer_towSum(_ nums:[Int], _ target:Int)->[Int] {
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            if nums[j]==target-nums[i] {
                return [i, j]
            }
        }
    }
    
    return []
}

print(answer_towSum([3,2,4], 6))



