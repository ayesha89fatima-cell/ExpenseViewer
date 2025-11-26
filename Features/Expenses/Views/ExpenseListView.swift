//
//  ExpenseListView.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import SwiftUI

public struct ExpenseListView: View {

    @StateObject private var viewModel: ExpenseListViewModel

    public init(viewModel: ExpenseListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                        .accessibilityIdentifier("loading_indicator")

                } else if let error = viewModel.errorMessage {
                    ExpenseErrorStateView(message: error) {
                        Task { await viewModel.load() }
                    }

                } else if viewModel.items.isEmpty {
                    EmptyStateView()

                } else {
                    List(viewModel.items) { item in
                        ExpenseRowView(data: item)
                    }
                    .accessibilityIdentifier(Constants.AccessibilityID.expenseList)
                }
            }
            .navigationTitle(Constants.Text.appTitle)
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.load()
            }
        }
    }
}
