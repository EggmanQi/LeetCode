import UIKit

var str = "Hello, playground"

func maxProfit(_ prices: [Int]) -> Int {
 
    if prices.count == 0 || prices.count==1 {
        return 0;
    }
    
    var result = 0
    var temp = 0
    
    for i in 1..<prices.count {
        temp = prices[i]-prices[i-1]
        if temp>0 {
            result = result + temp
        }
    }
    
    return result
}

var arr:Array = [2,1,2,1,1,0,1,2]
print(maxProfit(arr))
