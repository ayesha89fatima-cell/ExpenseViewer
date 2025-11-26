//
//  MockExpenseService.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
@testable import ExpenseViewer

final class MockExpenseService: ExpenseServiceProtocol {
    var result: Result<[Expense], Error> = .success([])
    
    func fetchExpenses() async throws -> [Expense] {
        switch result {
        case .success(let expenses):
            return expenses
        case .failure(let error):
            throw error
        }
    }
}
