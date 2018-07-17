// 找到临时的最小值
// 比较相邻的值, 大于则比较下一个, 直到相邻的值小于前一个

import UIKit

var str = "Hello, playground"

func maxProfit(_ prices: [Int]) -> Int {
 
    if prices.count == 0 || prices.count==1 {
        return 0;
    }
    
    var result = 0
    var min = 0
    var max = 0
    var next = 1
    var isBuy = false
    
    for i in 0..<prices.count {
        
        if next>=prices.count {
            if max>0 || min>0 {
                result = result + max-min
            }
            break
        }
        
        if prices[i] < prices[next] {
            
            if isBuy==false {
                min = prices[i]
            }
            max = prices[next]
            
            isBuy = true
        }else if prices[i] > prices[next] {
            result = result + (max-min);
            max=0
            min=0
            isBuy = false
        }
        
        next = next + 1
    }
    
    return result
}

var arr:Array = [7,1,5,3,6,4]//[2,1,2,1,1,0,1,2]
print(maxProfit(arr))
