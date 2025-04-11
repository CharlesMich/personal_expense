//
//  TransactionRow.swift
//  personal_expense
//
//  Created by Charles Michael on 4/9/25.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    var body: some View {
        HStack(spacing:20){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon1.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.icon1)
                }
            VStack(alignment: .leading, spacing: 6){
//                MARK: Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
//                MARK: Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
//                MARK: Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
//            MARK: Transaction Amount
                           Text(transaction.amount, format: .currency(code: "USD"))
                               .bold()
                               .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text1 : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
