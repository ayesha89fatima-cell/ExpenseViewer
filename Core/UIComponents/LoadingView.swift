//
//  LoadingView.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 24/11/25.
//

import SwiftUI

public struct LoadingView: View {
    public var text: String?
    public init(text: String? = nil) { self.text = text }
    public var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            if let t = text { Text(t).font(.caption).foregroundColor(.secondary) }
        }.padding()
    }
}

