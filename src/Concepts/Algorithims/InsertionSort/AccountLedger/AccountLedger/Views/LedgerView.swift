//
//  ContentView.swift
//  AccountLedger
//
//  Created by richard Haynes on 6/1/23.
//

import SwiftUI

struct LedgerView: View {
    @State private var model = LedgerViewModel()
    var body: some View {
        List{
            Text("Account Balances")
            ForEach(model.accountBalances, id: \.self){ account in
                let decimalString = "$ \(account.balance)"
                Text("Name: \(account.name) Balance: \(decimalString)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LedgerView()
    }
}
