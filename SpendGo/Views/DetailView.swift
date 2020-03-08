//
//  File.swift
//  SpendGo
//
//  Created by George Crisan on 23/02/2020.
//  Copyright © 2020 George Crisan. All rights reserved.
//

import SwiftUI


struct DetailView: View {
    @ObservedObject var budget: Budget

    var body: some View {
        Text("\(budget.budgetTitle ?? "No text")")
            .navigationBarTitle(Text("Detail"))
    }
}
