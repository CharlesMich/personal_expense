//
//  Extensions.swift
//  personal_expense
//
//  Created by Charles Michael on 4/8/25.
//

import Foundation
import SwiftUI

extension Color {
    static let background1 = Color("Background")
    static let icon1 = Color("Icon")
    static let text1 = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        return parsedDate
    }
}
