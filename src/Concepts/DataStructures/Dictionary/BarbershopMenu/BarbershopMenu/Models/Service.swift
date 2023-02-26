//
//  Service.swift
//  BarbershopMenu
//
//  Created by richard Haynes on 2/24/23.
//

import Foundation
struct Service {
    let name : String
    let price : Double
    init(name: String, price: Double) {
        self.name = name
        self.price = round(price * 100) / 100.0 // This will round up to 2 decimal places.
    }
}
