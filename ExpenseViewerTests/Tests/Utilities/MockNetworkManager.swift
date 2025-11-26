//
//  MockNetworkManager.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
@testable import ExpenseViewer

final class MockNetworkManager: NetworkManaging {
    var dataToReturn: Data?
    var responseToReturn: URLResponse?
    var errorToThrow: Error?
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = errorToThrow { throw error }
        return (dataToReturn ?? Data(), responseToReturn ?? HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!)
    }
}
