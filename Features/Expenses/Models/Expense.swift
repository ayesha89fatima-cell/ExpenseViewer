//
//  Expense.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Foundation

public struct Expense: Codable, Identifiable, Equatable {
    public let id: String
    public let title: String
    public let amount: Double
    public let date: Date

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case amount
        case date
    }
}

