//
//  File.swift
//  SpendGo
//
//  Created by George Crisan on 01/03/2020.
//  Copyright © 2020 George Crisan. All rights reserved.
//

import SwiftUI


class AppState: ObservableObject {
    @Published var showBudgetForm:Bool = false;
    @Published var showBudgetList:Bool = false;
    @Published var tempString:String = "temp text";
}
