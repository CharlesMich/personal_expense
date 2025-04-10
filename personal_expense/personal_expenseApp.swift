//
//  personal_expenseApp.swift
//  personal_expense
//
//  Created by Charles Michael on 4/8/25.
//

import SwiftUI

@main
struct personal_expenseApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
