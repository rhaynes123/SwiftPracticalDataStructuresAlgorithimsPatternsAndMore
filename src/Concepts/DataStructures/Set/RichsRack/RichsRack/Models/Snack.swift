//
//  Snack.swift
//  RichsRack
//
//  Created by richard Haynes on 4/8/23.
//

import Foundation

struct Snack: Hashable, Comparable{
    static func < (lhs: Snack, rhs: Snack) -> Bool {
        return lhs.Name < rhs.Name
    }
    
    let Id : UUID
    let Name : String
    let Price: Decimal
    let Category: Category
    
    init(name: String, price: Decimal, category: Category) {
        self.Id = UUID()
        self.Name = name
        self.Price = price
        self.Category = category
    }
}
