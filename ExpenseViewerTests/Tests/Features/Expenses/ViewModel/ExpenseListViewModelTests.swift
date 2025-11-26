//
//  ExpenseListViewModelTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
@testable import ExpenseViewer


// MARK: - ExpenseListViewModel Tests
final class ExpenseListViewModelTests: XCTestCase {
    
    func testViewModelLoad_success() async {

        let expense = Expense(id: "1", title: "Test", amount: 50, date: Date())
        let service = MockExpenseService()
        service.result = .success([expense])
        let vm = await MainActor.run {
            ExpenseListViewModel(service: service)
        }
        
        await vm.load()
        
        await MainActor.run {
            XCTAssertFalse(vm.isLoading)
            XCTAssertNil(vm.errorMessage)
            XCTAssertEqual(vm.items.count, 1)
            XCTAssertEqual(vm.items.first?.title, "Test")
        }
    }
    
    func testViewModelLoad_failure() async {

        let service = MockExpenseService()
        service.result = .failure(APIError.badURL("https://test.com"))
        let vm = await MainActor.run {
            ExpenseListViewModel(service: service)
        }
        await vm.load()
        
        await MainActor.run {
            XCTAssertFalse(vm.isLoading)
            XCTAssertNotNil(vm.errorMessage)
            XCTAssertTrue(vm.items.isEmpty)
        }
    }
    
    func testViewModelLoad_empty() async {
        
        let service = MockExpenseService()
        service.result = .success([])
        let vm = await MainActor.run {
            ExpenseListViewModel(service: service)
        }
        
        await vm.load()
        
        await MainActor.run {
            XCTAssertFalse(vm.isLoading)
            XCTAssertNil(vm.errorMessage)
            XCTAssertTrue(vm.items.isEmpty)
        }
    }
}
