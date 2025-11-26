//
//  ExpenseErrorStateViewTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
import SwiftUI
@testable import ExpenseViewer

final class ExpenseErrorStateViewTests: XCTestCase {
    
    func testExpenseErrorStateView_rendersAndRetry() {
        let expectationCalled = XCTestExpectation(description: "Retry closure called")
        
        let view = ExpenseErrorStateView(message: "Test Error") {
            expectationCalled.fulfill()
        }
        
        XCTAssertNotNil(view)
        
        // Simulate tapping the retry button
        view.retryAction()
        wait(for: [expectationCalled], timeout: 1.0)
    }
}

