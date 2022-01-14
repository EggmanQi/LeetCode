import UIKit

let question = "给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。算法的时间复杂度应该为 O(log (m+n)) 。"
let understand = "中位数：指的是该数的左右个数相等"

// 使用 swift api 的解法, 80ms, 13.9 MB
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
	
	if nums1.isEmpty && nums2.isEmpty {
		return 0.0
	}
	
	var nums3 = nums1 + nums2
	nums3 = nums3.sorted()
	let centerIndex = nums3.count/2
	let isOneCenter = nums3.count%2
//	print(nums3, centerIndex, isOneCenter)
	
	if (isOneCenter == 0) {
		return (Double(nums3[centerIndex]) + Double(nums3[centerIndex-1]))/2
	}else {
		return Double(nums3[centerIndex])
	}
}

// 使用递归的解法, 80ms, 13.9 MB
func findMedianSortedArrays_2(_ nums1: [Int], _ nums2: [Int]) -> Double {
	if nums1.isEmpty && nums2.isEmpty {
		return 0.0
	}
	let center1 = (nums1.count+nums2.count+1)/2
	let center2 = (nums1.count+nums2.count+2)/2
	return (Double(exampleSolve(nums1, 0, nums2, 0, center1)) +
			Double(exampleSolve(nums1, 0, nums2, 0, center2)) )/2
}
func exampleSolve(_ nums1:[Int], _ i:Int, _ nums2:[Int], _ j:Int, _ k:Int) -> Int {
	if( i >= nums1.count) {return (nums2[j + k - 1])}
	if( j >= nums2.count) {return (nums1[i + k - 1])}
	if(k == 1){
		return (min(nums1[i], nums2[j]));
	}
	let midVal1 = (i + k / 2 - 1 < nums1.count) ? nums1[i + k / 2 - 1] : Int.max;
	let midVal2 = (j + k / 2 - 1 < nums2.count) ? nums2[j + k / 2 - 1] : Int.max;
	if(midVal1 < midVal2){
		return (exampleSolve(nums1, i + k / 2, nums2, j , k - k / 2));
	}else{
		return (exampleSolve(nums1, i, nums2, j + k / 2 , k - k / 2));
	}
}


print(findMedianSortedArrays([1,2,3,4,5], [2,3,4,5,6]))
print(findMedianSortedArrays_2([1,2,3,4,5], [2,3,4,5,6]))



