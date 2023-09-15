import UIKit
/*
 https://www.linkedin.com/pulse/binary-search-algorithm-tutorial-swift-shuvo-karmakar/
 https://medium.com/@Lakshmnaidu/binary-search-in-swift-527ea58c55b7
 https://www.tutorialspoint.com/swift-program-to-implement-binary-search-algorithm
 https://www.appypie.com/binary-search-swift-how-to
 */

func BinarySearch<T: Comparable>(_ array: [T], value: T) -> Int {
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

struct Money: Comparable {
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount < rhs.amount
    }
    static func == (lhs: Money, rhs: Money){
        lhs.amount == rhs.amount
    }
    
    var amount: Decimal
}

let money : [Money] = [
Money(amount: 10),
Money(amount: 2),
Money(amount: 2.98),
Money(amount: 30),
]

let index = BinarySearch(money.sorted(), value: Money(amount: 10))
print(index)
