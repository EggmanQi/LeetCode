import UIKit

//给定两个数组，写一个方法来计算它们的交集。
//
//例如:
//给定 nums1 = [1, 2, 2, 1], nums2 = [2, 2], 返回 [2, 2].
//
//注意：
//
//输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
//我们可以不考虑输出结果的顺序。
//跟进:
//
//如果给定的数组已经排好序呢？你将如何优化你的算法？
//如果 nums1 的大小比 nums2 小很多，哪种方法更优？
//如果nums2的元素存储在磁盘上，内存是有限的，你不能一次加载所有的元素到内存中，你该怎么办？


func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    if errorHandle(nums1) || errorHandle(nums2) {
        return []
    }
    
    let arr_1 = solotion_1(nums1, nums2) // 300+ ms
    
    let arr_2 = solotion_2(nums1, nums2) // 20+ ms
    
    let arr_3 = solotion_3(nums1, nums2) // 40+ ms
    
    print(arr_1, arr_2, arr_3, separator: ",")
    
    return []
}

// 对数组的插入和删除将增加时间复杂度
func solotion_1(_ nums1: [Int], _ nums2: [Int]) -> [Int]
{
    var sortArr : [Int] = []
    var alreadyIntesectArr : [Int] = []
    sortArr.append(contentsOf:nums2)
    
    for x in nums1 {
        if sortArr.contains(x) {
            alreadyIntesectArr.append(x)
            sortArr.remove(at: sortArr.firstIndex(of: x)!)
        }
    }
    
    return alreadyIntesectArr
}

func solotion_2(_ nums1: [Int], _ nums2: [Int]) -> [Int]
{
    var result:[Int] = []
    var map:[Int:Int] = [:]
    
    for i in nums1 {
        var count = 0
        if map.keys.contains(i) {
            count = map[i]!
        }
        map[i] = count+1
    }
    
    for i in nums2 {
        if map.keys.contains(i) {
            let count = map[i]!
            if count>0 {
                result.append(i)
                map[i] = count-1
            }
        }
    }
    
    return result
}

// 最开始的想法, 对语法不熟悉所以要翻答案才能写出来
func solotion_3(_ nums1: [Int], _ nums2: [Int]) -> [Int]
{
    var result:[Int] = []
    var indexs:[Int] = []
    
    for i in 0..<nums1.count {
        let temp = nums1[i]
        
        for j in 0..<nums2.count {
            if temp == nums2[j] {
                var exist = false
                for k in 0..<indexs.count {
                    if j==indexs[k] {
                        exist = true
                        break
                    }
                }
                
                if !exist {
                    indexs.append(j)
                    result.append(temp)
                    break;
                }
            }
        }
    }
    
    return result
}

// 给定有序的数组, 遍历时可从上一次重复的数字下标开始
func solotion_4(_ nums1: [Int], _ nums2: [Int]) -> [Int]
{
    return []
}

func errorHandle(_ nums: [Int]) -> Bool
{
    if nums.count==0 {
        return true
    }
    return false
}

print(intersect([1,2,2,1], [2,2]));
