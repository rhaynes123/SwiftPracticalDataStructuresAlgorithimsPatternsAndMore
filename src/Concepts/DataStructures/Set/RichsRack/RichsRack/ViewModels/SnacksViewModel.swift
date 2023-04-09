//
//  SnacksViewModel.swift
//  RichsRack
//
//  Created by richard Haynes on 4/8/23.
//

import Foundation
final class SnacksViewModel: ObservableObject {
    @Published var searchedSnack: Snack? = nil
    @Published var snackName: String = ""
    
     let Snacks: Set<Snack>=[
        Snack(name: "Pepsi", price: 2.00, category: .Pop),
        Snack(name: "Coke", price: 2.00 ,category: .Pop),
        Snack(name: "Doritos", price: 3.25, category: .Chips),
        Snack(name: "Lays", price: 3.00, category: .Chips),
        Snack(name: "Pringles", price: 3.50, category: .Chips),
        Snack(name: "Oreos", price: 3.00, category: .Cookies),
    ]
    
    var filteredSnacks: Set<Snack> {
        if let snack = searchedSnack {
            var snacks : Set<Snack> = []
            snacks.insert(snack)
            return snacks
        }
        return Snacks
    }
    
    func searchSnacks(name: String) {
        searchedSnack = Snacks.first(where: {$0.Name.localizedCaseInsensitiveContains(name)})
    }
    
}
