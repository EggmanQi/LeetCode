import UIKit

var str = "给定一个 32 位有符号整数，将整数中的数字进行反转。"

func reverse(_ x: Int) -> Int {
    
    return solution_2(x)
}

func solution_1(_ x: Int) -> Int {
    var arr = Array("\(x)")
    arr.reverse()
    
    var result:String = ""
    let isFlag : Bool = x<0
    
    var tmp:Int = 0
    
    for item in arr {
        if (item=="0" && result.count>0) || (item>="1" && item<="9") {
            result = "\(result)\(item)"
        }
    }
    
    if result.count==0 {
        return 0
    }
    
    tmp = Int(result)!
    
    if tmp>Int32.max {
        return 0
    }
    
    if  isFlag {
        tmp = tmp * -1
    }
    
    return tmp;
}

func solution_2(_ x: Int) -> Int {
    var i = x
    var j = 0
    
    while i != 0  {
        let max = Int32.max
        if (abs(j) > (max / 10)) {
            return 0;
        }
        j = j * 10 + i % 10
        i = i / 10
    }
    
    return j
}

print(reverse(-321))
