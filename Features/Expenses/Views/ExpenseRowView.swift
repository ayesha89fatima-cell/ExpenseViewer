//
//  ExpenseRowView.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import SwiftUI

public struct ExpenseRowView: View {
    public let data: ExpenseViewData
    
    public init(data: ExpenseViewData) {
        self.data = data
    }
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                
                // Title
                Text(data.title)
                    .font(.body)
                    .accessibilityLabel(NSLocalizedString(
                        "expense_title_label",
                        comment: "Accessibility label for expense title"
                    ))
                    .accessibilityValue(data.title)
                
                // Date
                Text(data.formattedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .accessibilityLabel(NSLocalizedString(
                        "expense_date_label",
                        comment: "Accessibility label for expense date"
                    ))
                    .accessibilityValue(data.formattedDate)
            }
            
            Spacer()
            
            // Amount
            Text(data.formattedAmount)
                .font(.body)
                .accessibilityLabel(NSLocalizedString(
                    "expense_amount_label",
                    comment: "Accessibility label for expense amount"
                ))
                .accessibilityValue(data.formattedAmount)
        }
        .padding(.vertical, 6)
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(Constants.AccessibilityID.expenseRow + data.id)
    }
}
