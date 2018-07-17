// 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
// 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
// 注意点:
// 1. 有序数组
// 2. 只操作传入的数组(不许新建)
// 3. 只需返回去重后的数组长度

import UIKit

func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    // 先做错误处理
    if nums.count==0 || nums.count==1 {
        return nums.count
    }
    
    var index = 0
    
    for i in 0..<nums.count {
        if nums[i] != nums[index] {
            index += 1
            nums[index] = nums[i]
        }
    }
    
    return index+1
}

var arr:Array = [1,1,2]
print(removeDuplicates(&arr))
