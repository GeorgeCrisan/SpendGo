//
//  ContentView.swift
//  SpendGo
//
//  Created by George Crisan on 18/02/2020.
//  Copyright © 2020 George Crisan. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct ContentView: View {
    @Environment(\.managedObjectContext)
    var viewContext   
 
    var body: some View {
        NavigationView {
            MasterView()
                .navigationBarTitle(Text("Master"))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation { Budget.create(in: self.viewContext) }
                        }
                    ) { 
                        Image(systemName: "plus")
                    }
                )
            Text("Detail view content goes here")
                .navigationBarTitle(Text("Detail"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Budget.budgetTitle, ascending: true)],
        animation: .default)
    var budgets: FetchedResults<Budget>

    @Environment(\.managedObjectContext)
    var viewContext

    var body: some View {
        List {
            ForEach(budgets, id: \.self) { budget in
                NavigationLink(
                    destination: DetailView(budget: budget)
                ) {
                    Text("Temp")
                }
            }.onDelete { indices in
                self.budgets.delete(at: indices, from: self.viewContext)
            }
        }
    }
}

struct DetailView: View {
    @ObservedObject var budget: Budget

    var body: some View {
        Text("\(budget.budgetTitle ?? "No text")")
            .navigationBarTitle(Text("Detail"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
