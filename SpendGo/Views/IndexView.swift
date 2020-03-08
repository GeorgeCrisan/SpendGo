//
//  File.swift
//  SpendGo
//
//  Created by George Crisan on 23/02/2020.
//  Copyright © 2020 George Crisan. All rights reserved.
//

import SwiftUI

struct IndexView:View {
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        
        
        VStack {
            Section(header: Text("List current budgets")){
                Text("Current budget or No budgets please add one \(appState.tempString)")
                Text("Current budget or No budgets please add one")
            }
            
            Section(header: Text("Add new Budget")){
                Text("Plus icon add new budget")
                Button(action: {
                    self.appState.showBudgetList = true;
                }) {
                    Text(" Press me ");
                }
            }
        }
    }
}
