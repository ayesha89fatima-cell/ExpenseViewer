//
//  ExpenseServiceTests.swift
//  ExpenseViewerTests
//
//  Created by Ayesha Fatima on 25/11/25.
//

import XCTest
@testable import ExpenseViewer

final class ExpenseServiceTests: XCTestCase {
    
    var mockNetwork: MockNetworkManager!
    var service: ExpenseService!
    
    override func setUp() {
        super.setUp()
        mockNetwork = MockNetworkManager()
        service = ExpenseService(network: mockNetwork, parser: ExpenseParserObjC())
    }
    
    override func tearDown() {
        mockNetwork = nil
        service = nil
        super.tearDown()
    }
    
    func testFetchExpenses_success() async throws {
        let jsonArray: [[String: Any]] = [["id":"1","title":"Test","amount":100,"date":"2021-07-03T01:50:00+01:00"]]
        mockNetwork.dataToReturn = try JSONSerialization.data(withJSONObject: jsonArray)
        mockNetwork.responseToReturn = HTTPURLResponse(url: URL(string: "https://test.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expenses = try await service.fetchExpenses()
        
        XCTAssertEqual(expenses.count, 1)
        XCTAssertEqual(expenses.first?.title, "Test")
    }
    
    func testFetchExpenses_httpError() async {
        mockNetwork.responseToReturn = HTTPURLResponse(url: URL(string: "https://test.com")!, statusCode: 404, httpVersion: nil, headerFields: nil)
        
        await XCTAssertThrowsErrorAsync {
            _ = try await self.service.fetchExpenses()
        }
    }
    
    func testFetchExpenses_decodingError() async {
        mockNetwork.dataToReturn = Data("invalid json".utf8)
        mockNetwork.responseToReturn = HTTPURLResponse(url: URL(string: "https://test.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        await XCTAssertThrowsErrorAsync {
            _ = try await self.service.fetchExpenses()
        }
    }
}
