//
//  Transaction.swift
//  personal_expense
//
//  Created by Charles Michael on 4/9/25.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Codable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: {$0.id == categoryId }) {
            return category.icon
        }
        return .question
    }
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name:"Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Auto & Transport", icon: .car_alt)
    static let feesAndCharges = Category(id: 4, name:"Bills & Utilities", icon: .file_invoice_dollar)
    static let foodAndDining = Category(id: 5, name: "Auto & Transport", icon: .car_alt)
    static let home = Category(id: 6, name:"Bills & Utilities", icon: .file_invoice_dollar)
    static let income = Category(id: 7, name: "Auto & Transport", icon: .car_alt)
    static let shopping = Category(id: 8, name:"Bills & Utilities", icon: .file_invoice_dollar)
    static let transfer = Category(id: 9, name: "Auto & Transport", icon: .car_alt)
    static let publicTransportation = Category(id: 2, name:"Bills & Utilities", icon: .file_invoice_dollar, mainCategoryId: 1)
    static let taxi = Category(id: 101, name: "Auto & Transport", icon: .car_alt, mainCategoryId: 1)
    static let mobilePhone = Category(id: 102, name:"Bills & Utilities", icon: .file_invoice_dollar, mainCategoryId: 2)
}

extension Category {
    static let categories: [Category] = [.autoAndTransport, .billsAndUtilities, .entertainment, .feesAndCharges, .foodAndDining, .home, .income, .shopping, .transfer]
    
    static let subCategories: [Category] = [
        .publicTransportation, .taxi, .mobilePhone
    ]
    
    static let all: [Category] = categories + subCategories
}

