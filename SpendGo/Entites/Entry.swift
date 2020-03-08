//
//  File.swift
//  SpendGo
//
//  Created by George Crisan on 23/02/2020.
//  Copyright © 2020 George Crisan. All rights reserved.
//

import SwiftUI
import CoreData

extension Entry {
    static func create(in managedObjectContext: NSManagedObjectContext){
        let newEntry = self.init(context: managedObjectContext)
        newEntry.timestamp = Date()
        newEntry.id = UUID()
        newEntry.value = 0
        newEntry.entDesc = "Default"
        newEntry.action = "remove"
        
        do {
            try managedObjectContext.save()
        } catch {
            
            // Handle errors differently here
            let fatalErrorMsg = error as NSError
            fatalError("Unresolved error from Entry \(fatalErrorMsg), \(fatalErrorMsg.userInfo)")
        }
    }
}

extension Collection where Element == Entry, Index == Int {
    func delete(at indices: IndexSet, from managedObjectContext: NSManagedObjectContext) {
        indices.forEach { managedObjectContext.delete(self[$0]) }
    
        do {
            try managedObjectContext.save()
        } catch {
            
            let fatalErrorMsg = error as NSError
            fatalError("Unable to delete Entry \(fatalErrorMsg), \(fatalErrorMsg.userInfo)");
        }
    }
}
