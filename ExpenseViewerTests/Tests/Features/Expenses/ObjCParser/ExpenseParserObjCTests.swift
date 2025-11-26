//
//  ExpenseParserObjCTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
@testable import ExpenseViewer

final class ExpenseParserObjCTests: XCTestCase {
    
    func testParseData_success() {
        let parser = ExpenseParserObjC()
        let jsonArray: [[String: Any]] = [["id": "1", "title": "Test"]]
        let data = try! JSONSerialization.data(withJSONObject: jsonArray)
        
        do {
            let result = try parser.parse(data: data)
            XCTAssertNotNil(result)
        } catch {
            XCTFail("Parsing should not fail: \(error)")
        }
    }
    
    func testParseData_failure() {
        let parser = ExpenseParserObjC()
        let invalidData = Data("invalid".utf8)
        
        do {
            _ = try parser.parse(data: invalidData)
            XCTFail("Parsing should have failed")
        } catch let error as NSError {
            XCTAssertEqual(error.domain, Constants.Parser.domain)
            XCTAssertEqual(error.code, Constants.Parser.errorInvalidFormat)
        } catch {
            XCTFail("Unexpected error type received")
        }
    }
}

