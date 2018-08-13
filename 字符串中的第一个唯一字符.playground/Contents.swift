import UIKit

var str = "给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。"

func firstUniqChar(_ s: String) -> Int {

    solution_1(s)   // max=log(n^2)
    solution_2(s)   // max=log(n*2), 生成了输入源那么大的额外空间
    return solution_3(s) // max=log(n*2), 生成了 26 长度数组的额外空间
}

func solution_1(_ s: String) -> Int {
    
    let arr = Array(s)
    print(arr)
    
    for n in 0..<(arr.count-1) {
        for m in 0..<arr.count {
            
            if n==m {
                break
            }
            
            let n_c = arr[n]
            let m_c = arr[m]
            
            print(n_c, m_c)
            
            if n_c == m_c {
                break
            }
            if m_c == arr.last {
                return n
            }
        }
    }
    
    return -1
}

func solution_2(_ s: String) -> Int {
    
    var dic : Dictionary = [Character:Int]()
    let arr = Array(s)
    for n in arr {
        if dic[n] == nil {
            dic[n] = 1
        }else {
            dic[n] = dic[n]!+1
        }
    }
    
    for n in arr {
        if dic[n] == 1 {
            return arr.index(of: n)!
        }
    }
    
    return -1
}

func solution_3(_ s: String) -> Int {
    var array = Array<Int>(repeating: 0, count: 26) // 存 26 字母的出现次数数组
    
    for character in s.unicodeScalars {
        let index = Int(character.value - 97) // a 的编码是 97
        array[index] = array[index] + 1
    }
    
    // 按顺序找到第一个值编码对应 array 小标的元素是 1 的下标
    for (index, character) in s.unicodeScalars.enumerated() {
        let count = array[Int(character.value - 97)]
        if count == 1 {
            return index
        }
    }
    return -1
}

print(firstUniqChar("oababoukgoug"))


