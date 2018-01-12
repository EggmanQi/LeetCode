//: Playground - noun: a place where people can play

import UIKit

var question = "输入32位的有符号整形数字，逆向输出"
var condiction1 = "输入123，输出 321"
var condiction2 = "输入-123，输出 -321"
var condiction3 = "输入120，输出 21"

func reverse(_ x:Int) -> Int {
    
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

print(reverse(1563847412));

print("参考答案")

func answer_reverse(_ x:Int) -> Int {
    var val = 0
    var tmp = x
    
    while tmp != 0 {
        val = val*10 + tmp%10
        tmp /= 10
    }
    
    return (val>Int32.max || val<Int32.min) ? 0 : val
}

print(answer_reverse(-123))
