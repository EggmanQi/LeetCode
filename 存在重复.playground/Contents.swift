import UIKit

let str = "给定一个整数数组，判断是否存在重复元素。如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。"

func containsDuplicate(_ nums: [Int]) -> Bool {
    
//    return solution_1(nums)
    return solution_2(nums)
}

func solution_1 (_ nums: [Int]) -> Bool {
    let set = Set(nums)
    return set.count != nums.count
}

func solution_2 (_ nums: [Int]) -> Bool {
    var dic : Dictionary = [Int : Int]()
    
    for i in 0..<nums.count {
        
        if let _ = dic[nums[i]] {
            return true
        }
        dic[nums[i]] = i
    }
    
    return false
}

func solution_3 (_ nums: [Int]) -> Bool {
    if nums.isEmpty || nums.count == 1 {
        return false
    }
    
    // 这是最开始的解决方案, 关键是 sorted 
    let nums = nums.sorted()
    
    for i in 0..<nums.count - 1 {
        if nums[i] == nums[i + 1] {
            return true
        }
    }
    return false
}

func createTestArr() -> Array<Int> {
    
    var arr:Array<Int> = []
    for i in 0..<1000 {
        arr.append(i)
    }
    return arr
}

print(containsDuplicate(createTestArr()))
