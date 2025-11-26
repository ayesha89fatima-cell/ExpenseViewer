//
//  ExpenseListViewModel.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Foundation
import Combine

@MainActor
public final class ExpenseListViewModel: ObservableObject {
    
    @Published public private(set) var items: [ExpenseViewData] = []
    @Published public private(set) var isLoading = false
    @Published public private(set) var errorMessage: String?
    
    private let service: ExpenseServiceProtocol
    private let formatterManager = FormatterManager.shared
    
    public init(service: ExpenseServiceProtocol) {
        self.service = service
    }
    
    public func load() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let expenses = try await service.fetchExpenses()
            
            // Sort by date
            let sortedExpenses = expenses.sorted { $0.date < $1.date }
            
            self.items = sortedExpenses.map { mapToViewData($0) }
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    private func mapToViewData(_ e: Expense) -> ExpenseViewData {
        ExpenseViewData(
            id: e.id,
            title: e.title,
            formattedAmount: formatterManager.currencyFormatter.string(from: NSNumber(value: e.amount)) ?? "\(e.amount)",
            formattedDate: formatterManager.dateFormatter.string(from: e.date)
        )
    }
}
