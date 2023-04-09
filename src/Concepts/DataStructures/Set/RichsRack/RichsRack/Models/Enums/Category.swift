//
//  Category.swift
//  RichsRack
//
//  Created by richard Haynes on 4/8/23.
//

import Foundation
enum Category : String{
    case Pop = "Pop"
    case Chips = "Chips"
    case Cookies = "Cookies"
    
    static var all : [Category] {
        return [Chips,Pop,Cookies]
    }
}
