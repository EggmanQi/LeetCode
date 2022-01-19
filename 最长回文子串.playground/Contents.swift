import UIKit
import Foundation

var question = "给你一个字符串 s，找到 s 中最长的回文子串。"
var idea = "遍历数组, 当前遍历对象 = (当前遍历下标+指定长度)的下标的对象, 若有不相同, 则重置下标"

func longestPalindrome(_ s: String) -> String {
	return ""
}

func longestPalindrome_fail_2(_ s: String) -> String {
	
	if (s.count < 2) {
		return s
	}
	
	var end: Int  = 0 		//开始位置
	var start: Int  = 0 		//开始位置
//	var maxLen : Int = 0		// 长度
//	var length : Int = s.count
	
	print("str: ", s)
	
	for (index, _) in s.enumerated() {
		print("1. ", index)
		let len1 = expandAroundCenter(s, index, index)
		let len2 = expandAroundCenter(s, index, index+1)
		print(" --- 3. ", len1, len2)
		let len = max(len1, len2)
		if len > end-start {
			start = index - (len - 1) / 2
			end = index + len / 2
		}
		print(" ---- 4. ", index)
	}
	
	let index_start = s.index(s.startIndex, offsetBy: start)
	let index_end = s.index(s.startIndex, offsetBy: end)
	
	let str = s[index_start..<index_end]
	return String(str)
}

func expandAroundCenter(_ s:String, _ left: Int, _ right: Int) -> Int {
	var l = left, r = right
	
	print(" -- 2.1 ",s[s.index(s.startIndex, offsetBy: l)] , s[s.index(s.startIndex, offsetBy: r)])
	
	while (l >= 0
		   && r < s.count-1
		   && String(s[s.index(s.startIndex, offsetBy: l)]).compare(String(s[s.index(s.startIndex, offsetBy: r)]))==ComparisonResult.orderedSame
	) {
		l = l-1;
		r = r+1;
	}
	
	print(" -- 2.2 ", l, r, r - l - 1)
	return r - l - 1
}

longestPalindrome("abcdefgfedcb")

func longestPalindrome_fail(_ s: String) -> String {
	let arr_ltr = Array(s) as! Array<Character>
	var arr_rtl = Array<Character>()
	for i in arr_ltr.reversed() {
		arr_rtl.append(i)
	}
//	print(arr_ltr)
//	print(arr_rtl)
	
	var index_start = -1
	var index_end = arr_ltr.count
	let temp_index_end = index_end
	var isMatching = false
	
	for (index, value) in arr_ltr.enumerated() {
		if index_start == -1 {
			index_start = index
		}
		
		print("v: ", value, index_start)
		if index_start >= index_end {
			break;
		}
		
		for i in (0..<index_end).reversed() {
			let v_tail = arr_ltr[i]
			print(i, v_tail)
			
			let oldMatching = isMatching
			
			if v_tail == value {
				isMatching = true
			}
			
			if oldMatching == isMatching {
				index_end = temp_index_end
			} else {
				index_end = index_end - 1
			}
			
			break
			
			
//			if (findSameValue(arr_ltr, value, i)) {
//				if (final_index_end == 0) {
//					final_index_end = i
//				}
//				index_end = index_end-1
//				break
//			}else {
//				final_index_end = 0;
//				index_end = arr_ltr.count
//
//			}
		}
		
//		for (_, val) in arr_ltr.enumerated().reversed() {
//			print( val )
//			if( findSameValue(arr_ltr, value, index_end) ){
//				if final_index_end==0 {
//					final_index_end = index_end
//				}
//				index_end = index_end - 1
//			}else {
//				final_index_end = 0;
//			}
//		}
		
		
		
//		for i in (0..<arr_ltr.count-1).reversed() {
//			let v_tail = arr_ltr[i]
//
//			if value == v_tail {
//				isMatching = true
//				index_end = i
//			}else {
//				if isMatching{
//					isMatching = false
//					break;
//				}
//			}
//		}
	
	}
	
	print("final:" , index_start , index_end )
	
	return ""
}

func findSameValue(_ targetArr:Array<Character>, _ targetValue:Character, _ index:Int) -> Bool {
	
	if index >= targetArr.count {
		return false
	}
	
	if targetArr[index] == targetValue {
		return true
	}
	
	return false
}

func loop(_ sourceArr:Array<String>, _ startIndex:Int, _ endIndex:Int) -> Bool {
	var end = endIndex
	for (index, value) in sourceArr.enumerated() {
		print(index, value)
		
		let endValue = sourceArr[end]
		if value==endValue {
			end = end - 1
		}else {
			return false
		}
	}
	
	return true
}


