//
//  ExpenseViewDataTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
@testable import ExpenseViewer

final class ExpenseViewDataTests: XCTestCase {
    
    func testExpenseViewDataEquatable() {
        let data1 = ExpenseViewData(id: "1", title: "A", formattedAmount: "$10", formattedDate: "Jan 1, 2021")
        let data2 = ExpenseViewData(id: "1", title: "A", formattedAmount: "$10", formattedDate: "Jan 1, 2021")
        let data3 = ExpenseViewData(id: "2", title: "B", formattedAmount: "$20", formattedDate: "Jan 2, 2021")
        
        XCTAssertEqual(data1, data2)
        XCTAssertNotEqual(data1, data3)
    }
}
