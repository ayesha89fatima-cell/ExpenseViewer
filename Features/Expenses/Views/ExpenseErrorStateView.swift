//
//  ExpenseErrorStateView.swift
//  ExpenseViewer
//
//
//  ExpenseErrorStateView.swift
//  ExpenseViewer
//

import SwiftUI

public struct ExpenseErrorStateView: View {
    let message: String
    let retryAction: () -> Void

    public init(message: String, retryAction: @escaping () -> Void) {
        self.message = message
        self.retryAction = retryAction
    }

    public var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundColor(.orange)

            Text(message.isEmpty ? Constants.Text.errorMessage : message)
                .font(.headline)
                .multilineTextAlignment(.center)
                .accessibilityLabel(NSLocalizedString(
                    "error_state_message",
                    comment: "Accessibility label for error message"
                ))

            Button(action: retryAction) {
                Text(Constants.Text.retry)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .accessibilityIdentifier(Constants.AccessibilityID.retryButton)
        }
        .padding()
        .accessibilityIdentifier(Constants.AccessibilityID.errorState)
    }
}

