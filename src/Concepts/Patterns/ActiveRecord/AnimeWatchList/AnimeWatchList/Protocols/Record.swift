//
//  Record.swift
//  AnimeWatchList
//
//  Created by richard Haynes on 3/4/23.
//

import Foundation
import CoreData

protocol Record {
    
}
extension Record where Self: NSManagedObject{
    func save() throws{
        try PersistenceProvider.shared.container.viewContext.save()
    }
    static var all: NSFetchRequest<Self>{
        let request = NSFetchRequest<Self>(entityName: String(describing: self))
        request.sortDescriptors = []
        return request
    }
}
