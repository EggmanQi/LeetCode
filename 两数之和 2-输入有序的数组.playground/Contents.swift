import UIKit

let desc = "给定一个已按照 非递减顺序排列  的整数数组 numbers ，请你从数组中找出两个数满足相加之和等于目标数 target 。"
let desc_2 = "函数应该以长度为 2 的整数数组的形式返回这两个数的下标值。numbers 的下标 从 1 开始计数 ，所以答案数组应当满足 1 <= answer[0] < answer[1] <= numbers.length 。"
let desc_3 = "你可以假设每个输入 只对应唯一的答案 ，而且你 不可以 重复使用相同的元素。"


func twoSum_Loop(_ numbers: [Int], _ target: Int) -> [Int] {
	/**
	 保利发
	 时间复杂度:O(n*n)
	 空间复杂度: O(1)
	 执行用时： 332 ms | >7.18%
	 内存消耗： 14 MB | >29.08%
	 */
	for i in 0..<numbers.count-1 {
		for j in 1..<numbers.count {
			if (i != j) && (numbers[i]+numbers[j] == target) {
				return [i+1, j+1];
			}
		}
	}
	return [-1, -1]
}

func twoSum_Mix_Final(_ numbers: [Int], _ target: Int) -> [Int] {
	/**
	 二分双指针 - 改进, 省了无效的双指针遍历
	 时间复杂度:O(logn)
	 空间复杂度: O(1)
	 执行用时： 24 ms | >97.79%
	 内存消耗： 13.8 MB | >85.08%
	 */
	var i = 0
	var j = numbers.count - 1
	
	while numbers[i]+numbers[j] != target {
		let mid = (j-i + 1)/2
		if numbers[mid] > target {
			j = mid - 1
			continue
		}
		if (numbers[i] + numbers[j] < target) {
			i += 1
		}else {
			j -= 1
		}
	}
	return [i+1, j+1]
}

func twoSum_Mix(_ numbers: [Int], _ target: Int) -> [Int] {
	/**
	 二分双指针
	 时间复杂度:O(logn)
	 空间复杂度: O(1)
	 执行用时： 28 ms | >76.24%
	 内存消耗： 14.2 MB | >6.08%
	 */
	while i<j {
		let m =  (i+j) >> 1
//		print("numbers[i] + numbers[m] = ", numbers[i] + numbers[m])
//		print("numbers[j] + numbers[m] = ", numbers[j] + numbers[m])
//		print("numbers[i] + numbers[j] = ", numbers[i] + numbers[j])
		// 先判断是否二分区间内, 再判断双指针结果
		if (numbers[i] + numbers[m]) > target {
			j = m - 1
		}else if (numbers[m] + numbers[j] < target) {
			i = m + 1
		}else if (numbers[j] + numbers[i] > target) {
			j -= 1
		}else if (numbers[i] + numbers[j] < target) {
			i += 1
		}else {
			return [i+1, j+1]
		}
	}
	return [-1, -1]
}

func twoSum_DoublePointer(_ numbers: [Int], _ target: Int) -> [Int] {
	/**
	 双指针
	 时间复杂度:O(n)
	 空间复杂度: O(1)
	 执行用时： 28 ms | >76.24%
	 内存消耗： 14 MB | >52.49%
	 */
	var left = 0
	var right = numbers.count - 1
	while (left<right) {
		let value = numbers[left] + numbers[right]
		if (value == target) {
			return [left+1, right+1]
		}else if (value < target) {
			left += 1
		}else {
			right -= 1
		}
	}
	
	return [-1, -1]
}

func twoSum_Bisection(_ numbers: [Int], _ target: Int) -> [Int] {
	/**
	 二分
	 时间复杂度:O(nlogn)
	 空间复杂度: O(1)
	 执行用时： 28 ms | >7624%
	 内存消耗： 14 MB | >52.49%
	 */
	for index in 0..<numbers.count {
		var low = index + 1
		var high = numbers.count-1
		while low <= high {
			let mid = (high-low)/2 + low
			let value = target-numbers[index]
			if (numbers[mid] == value) {
				return [index+1, mid+1]
			}else if (numbers[mid] > value) {
				high = mid - 1
			}else {
				low = mid + 1
			}
		}
	}
	
	return [-1, -1]
}

func twoSum_failure(_ numbers: [Int], _ target: Int) -> [Int] {
	
	var index = 0
	for number in numbers {
		let targetValue = target<0 ? (target+number) : (target-number)
		print(targetValue)
		if numbers.contains(targetValue) {
			if target<0 {
				if number<=target {
					continue
				}
			}else {
				if number>=target {
					continue
				}
			}
			
			
			let targetIndex = Int(numbers.firstIndex(of: targetValue) ?? 0)
			if targetIndex>numbers.count {
				break
			}
			return [index+1, targetIndex + 1]
		}
		index += 1
	}
	
	return [0]
}

print(twoSum_Mix([-1,0], -1))
print(twoSum_Mix([1,2,3,4,5,6], 5))
