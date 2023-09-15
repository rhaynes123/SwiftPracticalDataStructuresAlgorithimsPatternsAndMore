//
//  Company.swift
//  iStockz
//
//  Created by richard Haynes on 9/14/23.
//

import Foundation
struct Company : Comparable {
    var Name : String
    var Money : Money
    
    static func < (lhs: Company, rhs: Company) -> Bool {
        return lhs.Money < rhs.Money
    }
    static func == (lhs: Company, rhs: Company){
        lhs.Money == rhs.Money
    }
}
struct Money: Comparable {
    var amount: Decimal
    
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount < rhs.amount
    }
    static func == (lhs: Money, rhs: Money){
        lhs.amount == rhs.amount
    }
}
