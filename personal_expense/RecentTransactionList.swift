//
//  RecentTransactionList.swift
//  personal_expense
//
//  Created by Charles Michael on 4/10/25.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .bold()
                Spacer()
                NavigationLink {
                    
                } label: {
                    HStack(spacing: 4){
                        Text("See all")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element){ index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
                
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x:10, y:5)
    }
}

#Preview {
    let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    RecentTransactionList()
        .environmentObject(transactionListVM)
}
