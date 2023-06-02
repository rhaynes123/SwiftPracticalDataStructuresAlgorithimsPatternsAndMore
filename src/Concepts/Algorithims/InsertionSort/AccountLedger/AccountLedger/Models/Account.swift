//
//  Account.swift
//  AccountLedger
//
//  Created by richard Haynes on 6/2/23.
//

import Foundation

struct Account : Comparable, Hashable {
    static func < (lhs: Account, rhs: Account) -> Bool {
        lhs.balance < rhs.balance
    }
    
    var name : String
    var balance : Decimal
}
