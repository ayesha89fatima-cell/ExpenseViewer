//
//  ErrorView.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 24/11/25.
//

import SwiftUI

public struct ErrorView: View {
    public let title: String
    public let message: String?
    public let retry: (() -> Void)?

    public init(title: String, message: String? = nil, retry: (() -> Void)? = nil) {
        self.title = title; self.message = message; self.retry = retry
    }

    public var body: some View {
        VStack(spacing: 12) {
            Text(title).font(.headline)
            if let msg = message { Text(msg).font(.subheadline).foregroundColor(.secondary).multilineTextAlignment(.center) }
            if let retry = retry {
                Button("Retry") { retry() }.padding(.top, 6)
            }
        }.padding()
    }
}

