//
//  Services.swift
//  BarbershopMenu
//
//  Created by richard Haynes on 2/24/23.
//

import Foundation
struct Services {
    static let allServices: [String : Service] = [
        "Line" : Service(name:"Line", price : 10.00),
        "Shave" : Service(name:"Shave", price : 9.00),
        "Fade" : Service(name:"Fade", price : 9.00),
        "Shampoo" : Service(name:"Shampoo",price : 8.00),
        "LineShave" : Service(name:"Line and Shave",price : 15.00),
        "LineFade" : Service(name:"Line and Fade", price : 15.00),
        "FadeShaveShampoo" : Service(name:"Fade, Shave and Shampoo", price : 18.99)
    ]
}
