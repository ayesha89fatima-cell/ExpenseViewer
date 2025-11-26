//
//  ExpenseEmptyStateView.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import SwiftUI

public struct EmptyStateView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "tray")
                .font(.system(size: 48))
                .foregroundColor(.gray)

            Text(Constants.Text.emptyMessage)
                .font(.headline)
                .accessibilityLabel(NSLocalizedString(
                    "empty_state_message",
                    comment: "Accessibility label for empty state message"
                ))
        }
        .padding()
        .accessibilityIdentifier(Constants.AccessibilityID.emptyState)
    }
}
