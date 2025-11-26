//
//  FormatterManagerTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Testing

import XCTest
@testable import ExpenseViewer

final class FormatterManagerTests: XCTestCase {
    
    func testCurrencyFormatter() {
        let formatted = FormatterManager.shared.currencyFormatter.string(from: NSNumber(value: 100))
        XCTAssertNotNil(formatted)
    }
    
    func testDateFormatter() {
        let formatted = FormatterManager.shared.dateFormatter.string(from: Date())
        XCTAssertNotNil(formatted)
    }
}
