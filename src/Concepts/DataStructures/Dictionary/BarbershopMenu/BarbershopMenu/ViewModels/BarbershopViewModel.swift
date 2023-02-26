//
//  BarbershopViewModel.swift
//  BarbershopMenu
//
//  Created by richard Haynes on 2/24/23.
//

import Foundation
final class BarbershopViewModel: ObservableObject {
    @Published var services: [String : Service] = ["" : Service(name: "", price: 0.00)]
    
    func getServices(by name : String){
        if name == ""{
            services = Services.allServices
        }
        else{
            services = Services.allServices.filter {$0.key.contains(name)}
            
        }
    }
}
