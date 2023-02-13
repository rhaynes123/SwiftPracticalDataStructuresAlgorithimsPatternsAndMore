//
//  Snack.swift
//  SnackBar
//
//  Created by richard Haynes on 2/12/23.
//

import Foundation
struct Snack{
    var Name : String
    var Price : Decimal
    var Image : String?
    
    func FormatedDisplay() -> String{
        return "\(Image ?? "") $\(Price) \(Name)"
    }
}
