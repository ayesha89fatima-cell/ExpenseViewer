//
//  ExpenseServiceProtocol.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Foundation

public protocol ExpenseServiceProtocol {
    func fetchExpenses() async throws -> [Expense]
}
