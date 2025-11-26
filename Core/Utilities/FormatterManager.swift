//
//  FormatterManager.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Foundation

public final class FormatterManager {
    
    public static let shared = FormatterManager()
    
    public let currencyFormatter: NumberFormatter
    public let dateFormatter: DateFormatter
    
    private init() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        self.currencyFormatter = numberFormatter
        
        let df = DateFormatter()
        df.dateStyle = .medium
        self.dateFormatter = df
    }
}
