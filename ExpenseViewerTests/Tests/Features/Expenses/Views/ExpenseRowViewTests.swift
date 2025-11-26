//
//  ExpenseRowViewTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
import SwiftUI
@testable import ExpenseViewer

final class ExpenseRowViewTests: XCTestCase {
    
    func testExpenseRowView_renders() {
        let data = ExpenseViewData(id: "1", title: "Lunch", formattedAmount: "$20", formattedDate: "Nov 25, 2025")
        let view = ExpenseRowView(data: data)
        
        // check initialisation
        XCTAssertNotNil(view)
    }
}

