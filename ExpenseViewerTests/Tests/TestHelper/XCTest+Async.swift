//
//  XCTest+Async.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest

extension XCTestCase {
    
    /// Asserts that the given async closure throws an error.
    @discardableResult
    func XCTAssertThrowsErrorAsync<T>(
        _ message: String = "",
        _ closure: @escaping () async throws -> T,
        file: StaticString = #filePath,
        line: UInt = #line
    ) async -> Error? {
        do {
            _ = try await closure()
            XCTFail("Expected error to be thrown. \(message)", file: file, line: line)
        } catch {
            return error
        }
        return nil
    }
    
    /// Asserts that the given async closure does NOT throw an error.
    @discardableResult
    func XCTAssertNoThrowAsync<T>(
        _ message: String = "",
        _ closure: @escaping () async throws -> T,
        file: StaticString = #filePath,
        line: UInt = #line
    ) async -> T? {
        do {
            let result = try await closure()
            return result
        } catch {
            XCTFail("Unexpected error thrown: \(error). \(message)", file: file, line: line)
            return nil
        }
    }
}
