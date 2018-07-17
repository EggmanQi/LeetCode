import UIKit

func rotate(_ nums: inout [Int], _ k: Int) {
    var i = 0
    let count = nums.count
    
    while i<k {
        let temp = nums.last
        
        nums.insert(temp!, at: 0)
        nums.remove(at: count)
        
        i += 1
    }
    
    print(nums)
}

var arr: Array = [1,3,5,7,9,10]
print(rotate(&arr, 9))
