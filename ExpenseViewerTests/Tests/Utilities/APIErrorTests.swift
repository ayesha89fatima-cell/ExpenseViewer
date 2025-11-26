//
//  APIErrorTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
@testable import ExpenseViewer

final class APIErrorTests: XCTestCase {
    
    func testErrorDescription() {
        let error1 = APIError.badURL("test")
        XCTAssertEqual(error1.errorDescription, "Bad URL: test")
        
        let error2 = APIError.httpError(statusCode: 404, url: nil)
        XCTAssertEqual(error2.errorDescription, "HTTP error 404")
        
        let error3 = APIError.parsingFallbackFailed(reason: "fail")
        XCTAssertEqual(error3.errorDescription, "Parsing failed: fail")
        
        let underlyingError = NSError(domain: "", code: 0)
        let error4 = APIError.unknown(underlyingError)
        XCTAssertEqual(error4.errorDescription, "Unknown error: The operation couldn’t be completed. ( error 0.)")
    }
}
