//
//  ContentView.swift
//  iStockz
//
//  Created by richard Haynes on 9/14/23.
//

import SwiftUI

struct ContentView: View {
    private var BigCompanies : [Company] = [
        Company(Name: "Disney", Money: Money(amount: 7_063_563.73)),
        Company(Name: "Sony", Money: Money(amount: 1_023_563_002.23)),
        Company(Name: "Apple", Money: Money(amount: 2_503_783.20)),
        Company(Name: "Blizzard", Money: Money(amount: 1_620_063.45)),
    ]
    init() {
        Array<Any>.BubbleSort(sort: &BigCompanies)
    }
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Company Margins!")
                List {
                    ForEach(BigCompanies, id: \.Name) { company in
                        Text("# \(Array<Any>.BinarySearch(from: BigCompanies, value:company) + 1): \(company.Name) Loses: \(String(describing: company.Money.amount.formatted(.currency(code: "USD"))))")
                    }
                }
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
