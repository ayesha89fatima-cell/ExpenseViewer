//
//  ExpenseListViewTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
import SwiftUI
@testable import ExpenseViewer

final class ExpenseListViewTests: XCTestCase {

    func testExpenseListView_loadingState() async {
        let service = MockExpenseService()
        service.result = .success([])
        let vm = await MainActor.run {
            ExpenseListViewModel(service: service)
        }
        let view = await ExpenseListView(viewModel: vm)
        XCTAssertNotNil(view)
        
        await vm.load()
    }

    func testExpenseListView_errorState() async {
        let service = MockExpenseService()
        service.result = .failure(APIError.badURL("https://test.com"))
        let vm = await MainActor.run {
            ExpenseListViewModel(service: service)
        }
        
        let view = await ExpenseListView(viewModel: vm)
        XCTAssertNotNil(view)
        
        await vm.load()
    }

    func testExpenseListView_emptyState() async {
        let service = MockExpenseService()
        service.result = .success([])
        let vm = await MainActor.run {
            ExpenseListViewModel(service: service)
        }
        
        let view = await ExpenseListView(viewModel: vm)
        XCTAssertNotNil(view)
        
        await vm.load()
    }

    func testExpenseListView_listItems() async {
        let expense = Expense(id: "1", title: "Test", amount: 50, date: Date())
        let service = MockExpenseService()
        service.result = .success([expense])
        let vm = await MainActor.run {
            ExpenseListViewModel(service: service)
        }
        
        let view = await ExpenseListView(viewModel: vm)
        XCTAssertNotNil(view)
    }
}


