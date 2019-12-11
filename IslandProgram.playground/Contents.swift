import UIKit

let ROW = 5
let COL = 5

class Islands {
    
    func isSafe(matrix:[[Int]], row:Int, col:Int, visited:[[Bool]]) -> Bool {
        return (row >= 0) && (row < ROW) && (col >= 0) && (col < COL) && (matrix[row][col] == 1 && !visited[row][col])
    }
    
    func dfs(matrix:[[Int]], row:Int, col:Int, visited:inout [[Bool]]) {
        let rowNbr = [-1, -1, -1, 0, 0, 1, 1, 1]
        let colNbr = [-1, 0, 1, -1, 1, -1, 0, 1]
        
        visited[row][col] = true
        
        for index in 0...7 {
            if isSafe(matrix: matrix, row: row + rowNbr[index], col: col + colNbr[index], visited: visited) {
                dfs(matrix: matrix, row: row + rowNbr[index], col: col + colNbr[index], visited: &visited)
            }
        }
    }
    
    func countIslands(matrix:[[Int]]) {
//        print(matrix)
        var visited = [[Bool]]()
        
        for row in 0...ROW - 1 {
            visited.append([false])
               for _ in 0...COL - 1 {
                visited[row].append(false)
            }
        }
    
        var count = 0;
        for row in 0...ROW - 1 {
            for col in 0...COL - 1 {
                if matrix[row][col] == 1 && visited[row][col] == false {
                    dfs(matrix: matrix, row: row, col: col, visited: &visited)
                    count += 1;
                }
            }
        }
        print("Total number of islands are \(count)")
    }
}

var island = Islands()
let matrix:[[Int]] = [ [ 1, 1, 0, 0, 0 ],
                      [ 0, 1, 1, 0, 1 ],
                      [ 1, 0, 0, 1, 1 ],
                      [ 0, 0, 0, 0, 0 ],
                      [ 1, 0, 1, 0, 1 ]]
island.countIslands(matrix: matrix)
