//
//  ExpenseViewData.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Foundation

public struct ExpenseViewData: Identifiable, Equatable {
    public let id: String
    public let title: String
    public let formattedAmount: String
    public let formattedDate: String
}
