//
//  ContentView.swift
//  BarbershopMenu
//
//  Created by richard Haynes on 2/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = BarbershopViewModel()
    @State private var serviceName : String = ""
    var body: some View {
        NavigationView {
            List {
                TextField("Shave?", text: $serviceName)
                    .onChange(of: serviceName){ service in
                        model.getServices(by: serviceName)
                    }
                
                ScrollView {
                    // This orders the services in alphabetical order
                    ForEach(model.services.sorted(by: {$0.key < $1.key}), id: \.key){ key, value in
                        HStack{
                            Text("\(value.name)"+": $\(value.price)")
                        }
                    }
                }
            }
        }.onAppear {
            model.getServices(by: serviceName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
