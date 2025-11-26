//
//  NetworkManager.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Foundation

public final class NetworkManager: NetworkManaging {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await session.data(for: request)
    }
}

