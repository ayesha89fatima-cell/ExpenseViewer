//
//  AppConstants.swift
//  ExpenseViewer
//

import Foundation

enum Constants {

    enum API {
        static let baseURL = "https://www.jsonkeeper.com"
        static let expensesPath = "/b/DYZJF"
        static let timeout: TimeInterval = 30
    }

    enum AccessibilityID {
        static let expenseList = "expense_list"
        static let expenseRow = "expense_row_"
        static let emptyState = "empty_state"
        static let errorState = "error_state"
        static let retryButton = "retry_button"
    }

    enum Text {
        static let appTitle = "Expense Viewer"
        static let emptyMessage = "No expenses available"
        static let errorMessage = "Something went wrong"
        static let retry = "Retry"
        static let currencyFormat = "%.2f"
        static let dateFormat = "dd MMM yyyy"
    }

    enum Test {
        static let mockJSONFilename = "MockExpenses"
    }

    enum Parser {
        static let domain = "ExpenseParserObjC"
        static let errorNoData = 100
        static let errorInvalidFormat = 101
        static let messageNoData = "No data"
        static let messageExpectedArray = "Expected array"
    }
}
