//
//  Array+Extensions.swift
//  iStockz
//
//  Created by richard Haynes on 9/14/23.
//
// Helpful Links
/*
 https://big-o.io/examples/bubble-sort/swift/
 https://diningwithrobots.com/2020/06/05/bubble-sort-with-swift/
 https://github.com/kodecocodes/swift-algorithm-club/tree/master/Bubble%20Sort
 https://www.tutorialspoint.com/swift-program-to-sort-an-array-in-ascending-order-using-bubble-sort
 */
import Foundation
extension Array {
    static func BinarySearch<T: Comparable>(from array: [T], value: T) -> Int {
        var lowerIndex = 0
        var upperIndex = array.count - 1
        
        while lowerIndex <= upperIndex {
            let middleIndex = (lowerIndex + upperIndex) / 2
            let middleValue = array[middleIndex]
            
            if middleValue == value {
                return middleIndex
            } else if middleValue > value {
                upperIndex = middleIndex - 1
            } else {
                lowerIndex = middleIndex + 1
            }
        }
        
        return -1
    }
    
    static func BubbleSort<T: Comparable>(sort array: inout [T]) {
       var countOf = array.count
       while (countOf > 0) {
           var lastModifiedIndex = 0
           for currentIndex in 1..<countOf {
               if array[currentIndex - 1] > array[currentIndex] {
                   let temp = array[currentIndex - 1]
                   array[currentIndex - 1] = array[currentIndex]
                   array[currentIndex] = temp
                   lastModifiedIndex = currentIndex
               }
           }
           countOf = lastModifiedIndex
       }
   }
    
}
