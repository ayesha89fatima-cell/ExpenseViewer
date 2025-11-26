//
//  NetworkManaging.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Foundation

public protocol NetworkManaging {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}
