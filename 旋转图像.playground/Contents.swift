import UIKit

var str = "2唯数组旋转90度"

func rotate(_ matrix: inout [[Int]]) {
    
    let count = demo.count
    
    for i in 0..<count{
        for j in (i+1)..<count {
            let temp = demo[i][j]
            demo[i][j] = demo[j][i]
            demo[j][i] = temp
        }
        matrix[i].reverse()
    }
    
    print(matrix)
}

//var demo = [
//    [ 5, 1, 9,11],
//    [ 2, 4, 8,10],
//    [13, 3, 6, 7],
//    [15,14,12,16]
//]

var demo = [[1,2,3],
            [4,5,6],
            [7,8,9]]

print(rotate(&demo))
