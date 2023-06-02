//
//  LedgerViewModel.swift
//  AccountLedger
//
//  Created by richard Haynes on 6/1/23.
//
// https://victorqi.gitbooks.io/swift-algorithm/content/insertion_sort.html
import Foundation


final class LedgerViewModel : ObservableObject {
    private var samples : [Account] = [
        Account(name: "Brians Pizza Slices", balance: 23433.90),
        Account(name: "Wallace and Sons", balance: 55005.32),
        Account(name: "Tim's Toys for Tots", balance: 1008.23),
        Account(name: "Tia's Tips", balance: 1100.00),
    ]
    
    public var accountBalances : [Account] {
        return SortBalances(from: samples)
    }
    
    public func SortBalances(from inputs : [Account]) -> [Account] {
        var balances = inputs
        
        for index in 1..<balances.count {
            
            var destinationIndex = index
            let valueToMove = balances[destinationIndex]
            
            while destinationIndex > 0 && valueToMove < balances[destinationIndex - 1] {
                balances[destinationIndex] = balances[destinationIndex - 1]
                destinationIndex -= 1
            }
            
            balances[destinationIndex] = valueToMove
        }
        return balances
    }
}



