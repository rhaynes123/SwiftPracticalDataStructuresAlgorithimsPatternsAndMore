//
//  Record.swift
//  TimeForACut
//
//  Created by richard Haynes on 4/1/23.
//

import Foundation
import CoreData
protocol Record {
    
}
extension Record where Self: NSManagedObject{
   
    static var all: NSFetchRequest<Self>{
        let request = NSFetchRequest<Self>(entityName: String(describing: self))
        request.sortDescriptors = []
        return request
    }
}
