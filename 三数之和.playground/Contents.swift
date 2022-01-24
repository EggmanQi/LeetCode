import UIKit
import Foundation

var question = "给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。"

var mark = "答案中不可以包含重复的三元组。"

func threeSum(_ nums: [Int]) -> [[Int]] {
	return threeSum_solution_2(nums)
}

print(threeSum([1,2,3, -4,0]))
print(threeSum([-1,0,1,2,-1,-4]))
print(threeSum([-2,0,0,2,2]))
print(threeSum([0,0,0]))
print(threeSum([13,-11,-14,4,-9,-10,-11,7,-14,-9,14,0,-5,-7,6,-9,11,6,-14,-12,-10,9,-8,-7,5,6,8,-12,-1,-4,14,-3,0,7,9,7,12,13,-9,13,11,-10,-10,-9,-10,12,-10,8,-5,13,11,-8,7,-12,0,-11,2,-14,-8,8,-3,13,-9,5,5,7,-11,-6,5,-13,-7,1,14,-10,-1,-11,-13,4,12,-11,2,0,-4,-14,4,4,-10,13,-3,-10,6,1,-12,4,-9,1,-4,-13,10,8,-11,10,-14,-12,-14,1,-8,10,-10,11,-15,0,-3,-12,1,-14,-1,-1,6,11,-4,-3,-2,-1,-13]))

func threeSum_solution_2(_ nums:[Int]) -> [[Int]] {
	
	/**
	 双指针 - 更好理解版本, 效率没什么变化
	 时间复杂度:O(n*n) ~= 排序(O(NlonN)) + 遍历(O(N))*双指针(O(N))
	 空间复杂度: O(1)
	 执行用时： 156 ms | >28.07%
	 内存消耗： 17.3 MB | >89.77%
	 */
	
	if nums.count < 3 {
		return []
	}
	
	var result = [[Int]]()
	let tempNums = nums.sorted();
	let n = nums.count
	
	for first in 0..<n {
		// 在数组被排序后, 第一个值>0, 则后续取值相加结果都 >0, loop end
		if tempNums[first] > 0 {
			return result
		}
		
		// 跳过和上个值相同的重复循环
		if first>0 && tempNums[first]==tempNums[first-1] {
			continue
		}
		
		var l = first+1, r = n-1
		while l<r {
			let tempReslut = tempNums[first] + tempNums[l] + tempNums[r]
			if (tempReslut > 0) {
				r -= 1
			}else if (tempReslut < 0) {
				l += 1
			}else {
				result.append([tempNums[first],tempNums[l],tempNums[r]])
				
				// 跳过下过值相同的情况
				while l<r && tempNums[l] == tempNums[l+1] {
					l += 1
				}
				while l<r && tempNums[r] == tempNums[r-1] {
					r -= 1
				}
				
				l+=1
				r-=1
			}
		}
	}
	
	return result
}

func threeSum_solution_loop(_ nums:[Int]) -> [[Int]] {
	
	/**
	 双指针
	 时间复杂度:O(n*n)
	 空间复杂度: O(1)
	 执行用时： 152 ms | >28.95%
	 内存消耗： 17.2 MB | >95.61%
	 */
	
	var result = [[Int]]()
	let numbers = nums.sorted()
	let n = nums.count
	
	for (first, _) in numbers.enumerated() {
		if first>0 && numbers[first] == numbers[first-1] {
			continue
		}
		
		var third = n-1
		let target = numbers[first] * -1
		
		for second in (first+1)..<n {
			if second>first+1 && numbers[second]==numbers[second-1] {
				continue
			}
			
			while second<third && numbers[second]+numbers[third] > target {
				third -= 1
			}
			
			if second == third {
				break
			}
			
			if numbers[second]+numbers[third] == target {
				result.append([numbers[first] , numbers[second] , numbers[third]])
			}
		}
	}
	
	return result
}

func threeSum_2(_ nums:[Int]) -> [[Int]] {
	
	let numbers = nums.sorted()
	print(numbers)
	
	var result = [[Int]]() // swift 初始化对象记得带上 ()
	
	for (index, value) in numbers.enumerated() {
		let tempValue = value * -1
		print(index, value)
		var i = index + 1
		var j = numbers.count-1
		print(i, j, numbers[i], numbers[j])
		while numbers[i] + numbers[j] != tempValue {
			if i == index {
				i += 1
				continue
			}
			if j == index {
				j -= 1
				continue
			}
			let mid = (j-i + 1)/2
 			if (numbers[mid] > tempValue) {
				j = mid-1
				continue
			}
			if numbers[i] + numbers[j] < tempValue {
				i += 1
			}else {
				j -= 1
			}
		}
		result.append([value, numbers[i], numbers[j]])
	}
	
	return result
}


func threeSum_Loop(_ nums:[Int]) -> [[Int]] {

//MARK: 可以用来测试 cpu 哈哈哈哈哈
	
	var result = [[Int]]() // swift 初始化对象记得带上 ()
	let count = nums.count
	if count < 3 {
		return result
	}
	
	for i in 0..<nums.count-2 {
		for j in 1..<nums.count-1 {
			for k in 2..<nums.count {
				if ((i != j && i != k && j != k) &&
					0 == (nums[i] + nums[j] + nums[k])) {
					var canAdd = true
					var tempArr = [nums[i], nums[j], nums[k]]
					tempArr.sort()
					for (_, value) in result.enumerated() {
						let tempValueArr = value.sorted()
						if tempArr == tempValueArr {
							canAdd = false
							break
						}
					}
					if canAdd {
						result.append(tempArr)
					}
				}
			}
		}
	}
	
	return result
}
