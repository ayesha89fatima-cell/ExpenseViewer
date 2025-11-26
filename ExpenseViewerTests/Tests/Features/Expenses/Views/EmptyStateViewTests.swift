//
//  EmptyStateViewTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
import SwiftUI
@testable import ExpenseViewer

final class EmptyStateViewTests: XCTestCase {
    
    func testEmptyStateView_renders() {
        let view = EmptyStateView()
        XCTAssertNotNil(view)
    }
}

