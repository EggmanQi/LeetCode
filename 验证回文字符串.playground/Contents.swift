import UIKit

var str = "给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写"

func isPalindrome(_ s: String) -> Bool {
    
    print(solution_1(s))
    return solution_2(s)
}

func solution_1(_ s: String) -> Bool {
    var str  = ""
    for character in s.lowercased().unicodeScalars {
        
        let isCharacter = Int(character.value)>96 && Int(character.value)<123
        let isNumber = Int(character.value)>47 && Int(character.value)<58
        
        if isCharacter || isNumber {
            str = str + String(character)
        }
    }
    
    let arr = Array(str)
    
    for i in 0..<arr.count {
        if i==(arr.count-i-1) {
            break;
        }
        
        let a = arr[i]
        let b = arr[arr.count-i-1]
        
        if a != b {
            return false
        }
    }
    
    return true
}

func solution_2(_ s:String) -> Bool {
    
    guard s.count>0 else {
        return true
    }
    
    let count = s.count
    var char = s.lowercased().cString(using: .utf8)
    var i = 0
    var j = count-1
    while i != j {
        let a = char![i]
        if !isCharacterOrNumber(a) {
            i = i+1
            continue
        }
        
        let b = char![j]
        if !isCharacterOrNumber(b) {
            j = j-1
            continue
        }
        
        if a != b {
            return false
        }
        
        i = i+1
        j = j-1
        
        if i>=j {
            return true
        }
    }
    
    return true
}

func isCharacterOrNumber(_ s:CChar) -> Bool {
    
    switch s {
        case 97...122: return true
        case 48...57 : return true
    default:
        return false
    }
}

//print(isPalindrome("A man, a plan, a canal: Panama"))
//print(isPalindrome("0p"))
print(isPalindrome("aa"))


