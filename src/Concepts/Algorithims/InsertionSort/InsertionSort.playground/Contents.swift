import UIKit

var greeting = "Hello, playground"

var arr = [4,3,2,1]
for i in 1..<arr.count{
    var y = i
        let temp = arr[y]
        while y > 0 && temp < arr[y - 1] {
          arr[y] = arr[y - 1]                // 1
          y -= 1
        }
        arr[y] = temp                      // 2
      }
 print(arr)
