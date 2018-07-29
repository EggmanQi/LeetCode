import UIKit

var str = "给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。"

func moveZeroes(_ nums: inout [Int]) {

    solution_1(&nums)
    solution_2(&nums)
}


func solution_1(_ nums: inout [Int]) {
    
    var max = 0
    var index = 0
    while index < nums.count-max {
        let n = nums[index]
        
        if n==0 {
            nums.append(n)
            nums.remove(at: index)
            max = max + 1
        }else {
            index = index + 1
        }
    }
    
    print(nums)
}


// 会影响顺序
func solution_2(_ nums: inout [Int]) {
    
//    nums.sort { (n1,n2) -> Bool in
//        return n1>0 && n2>0
//    }
    
    nums.sort()
    nums.reverse()
}

var arr = [1,0,0,3,0,444,5]//[0,1,0]
print(moveZeroes(&arr))
