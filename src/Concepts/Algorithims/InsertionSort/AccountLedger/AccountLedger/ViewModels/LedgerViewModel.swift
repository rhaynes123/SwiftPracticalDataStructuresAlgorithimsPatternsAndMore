//
//  LedgerViewModel.swift
//  AccountLedger
//
//  Created by richard Haynes on 6/1/23.
//
// https://victorqi.gitbooks.io/swift-algorithm/content/insertion_sort.html
import Foundation

final class LedgerViewModel : ObservableObject {
    private var samples : [Decimal] = [
        23433.90,
        55005.32,
        1008.23,
        1100.00,
    ]
    
    public var accountBalances : [Decimal] {
        return SortBalances(from: samples)
    }
    
    public func SortBalances(from inputs : [Decimal]) -> [Decimal] {
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



