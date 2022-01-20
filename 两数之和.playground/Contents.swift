import UIKit

//var str = "给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。"
let desc = "给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。"
let desc_2 = "你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。"
let desc_3 = "你可以按任意顺序返回答案。"

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    if nums.count<2 {
        return []
    }
    
    return sulotion_2(nums, target)
}

func sulotion_1(_ nums: [Int], _ target: Int) -> [Int] {
    /**
	 暴力遍历, O(N^2)
	 执行用时： 76 ms | >23.89%
	 内存消耗： 13.8 MB | >85.47%
	 */
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
	
	/**
	 单循环遍历, 额外内存开销 O(2n)
	 执行用时： 48 ms | >80.30%
	 内存消耗： 14.1 MB | >19.56%
	 */
	
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
