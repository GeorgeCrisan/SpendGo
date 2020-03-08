//
//  Event.swift
//  SpendGo
//
//  Created by George Crisan on 18/02/2020.
//  Copyright © 2020 George Crisan. All rights reserved.
//

import SwiftUI
import CoreData

extension Budget {
    static func create(in managedObjectContext: NSManagedObjectContext){
        let newBudget = self.init(context: managedObjectContext)
        newBudget.timestamp = Date()
        newBudget.id = UUID()
        newBudget.budgetDesc = "First"
        newBudget.budgetTitle = "First"
        
        
        do {
            try  managedObjectContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }   
}

extension Collection where Element == Budget, Index == Int {
    func delete(at indices: IndexSet, from managedObjectContext: NSManagedObjectContext) {
        indices.forEach { managedObjectContext.delete(self[$0]) }       
 
        do {
            try managedObjectContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
