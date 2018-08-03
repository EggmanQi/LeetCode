import UIKit

var str = "有效数独, 1:数字 1-9 在每一行只能出现一次。2:数字 1-9 在每一列只能出现一次。3:数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。"


func isValidSudoku(_ board: [[Character]]) -> Bool {

    // 已出现的数字
    //    每行唯一
    //    每列唯一
    //    3*3唯一
    
    return sulotion_1(board)
}

// 一开始理解错了, 其实只要验证给定的二维数组中的内容在限定的条件里是否唯一就可以了.
func sulotion_1(_ board:[[Character]]) -> Bool {
    
    var row = Set<Character>()
    var col = Set<Character>()
    
    for i in 0..<9 {
        row.removeAll()
        col.removeAll()
        
        for j in 0..<9 {
            
            
            if i%3==0 && j%3==0 {
                if checkBlock(board, i, j) {
                    return false
                }
            }
            
            let rowValue = board[i][j]
            if rowValue != "." {
                if row.contains(rowValue) {
                    return false
                }else {
                    row.insert(rowValue)
                }
            }
            
            let colValue = board[j][i];
            if colValue != "." {
                if col.contains(colValue) {
                    return false
                }else {
                    col.insert(colValue)
                }
            }
            
        }
    }
    
    
    
    return true
}

func checkBlock (_ board:[[Character]], _ rowIndex:Int, _ colIndex:Int) -> Bool {
    
    var num = Set<Character>()
    
    for i in rowIndex..<rowIndex+3 {
        for j in colIndex..<colIndex+3 {
            let target = board[i][j]
            if target != "." {
                if num.contains(target) {
                    return true
                }else {
                    num.insert(target)
                }
            }
        }
    }
    
    return false
}

var sudoku : [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]
print(isValidSudoku(sudoku))
