//
//  ExpenseViewerApp.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import SwiftUI

@main
struct ExpenseViewerApp: App {
    var body: some Scene {
        WindowGroup {
            let network = NetworkManager(session: .shared)
            let parser = ExpenseParserObjC()
            let service = ExpenseService(network: network, parser: parser)
            let viewModel = ExpenseListViewModel(service: service)
            ExpenseListView(viewModel: viewModel)
        }
    }
}
