//
//  PersistenceProvider.swift
//  GetSomeRepsIn
//
//  Created by richard Haynes on 5/6/23.
//

import Foundation
import CoreData
struct PersistenceProvider {
    static let shared = PersistenceProvider()

    static var preview: PersistenceProvider = {
        let result = PersistenceProvider()
        let viewContext = result.container.viewContext
       
        return result
    }()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "GetSomeRepsIn")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func saveContext(){
        let context = container.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }
            catch{
                let nserror = error as NSError
                print("Unexcpected error occurred saving content \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
