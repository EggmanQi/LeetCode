import UIKit

var str = "给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。"

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    if nums.count<2 {
        return []
    }
    
    return sulotion_2(nums, target)
}

func sulotion_1(_ nums: [Int], _ target: Int) -> [Int] {
    
    
    var index = 1
    
    for i in 0..<nums.count-1 {
        for j in index..<nums.count {
            if nums[i]+nums[j] == target {
                return [i, j]
            }
        }
        index = index + 1
    }
    
    return []
}

func sulotion_2(_ nums: [Int], _ target: Int) -> [Int] {
    let count = nums.count
    
    var dic = [Int : Int]()
    
    for i in 0..<count {
        dic[nums[i]] = i
    }
    
    for i in 0..<count {
        let found = target - nums[i]
        if let j = dic[found], i != j {
            return [i, j]
        }
    }
    return []
}

print(twoSum([9,12,6,2,7,11,5], 9))
