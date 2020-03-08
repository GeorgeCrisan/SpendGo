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
    @EnvironmentObject var appState: AppState
    //@Environment(\.managedObjectContext)
    //var viewContext   
    
    
    var body: some View {
        
        VStack {
            if (self.appState.showBudgetList == true) {
                
            } else if (self.appState.showBudgetForm == true) {
                
            } else {
                
                Spacer()
                Text("Spendingo")
                    .padding(26)
                
                VStack {
                    Text("You have not created a bugdet yet")
                    Text("Soon as you have at least a budget created, you can see a summary here")
                    .frame(width: 300)
                    .padding(10)
                }
                .fixedSize()
                .frame(width: 330, height: 250)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green, lineWidth: 4)
                )
                
                Spacer()
                
                VStack {
                    Text("List your budgets")
                    Text("See your budgets, manage them and your entries")
                    .frame(width: 200)
                    .padding(10)
                }
                .fixedSize()
                .frame(width: 330, height: 130)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue, lineWidth: 4)
                )
                
                Spacer()
                
                VStack {
                    Text("Add a new Budget...")
                    Text("Create a new budget and track your expenses! ")
                        .frame(width: 300)
                        .padding(10)
                }
                .fixedSize()
                .frame(width: 330, height: 130)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue, lineWidth: 4)
                )
                Spacer()
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
