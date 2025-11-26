//
//  ExpenseService.swift
//  ExpenseViewer


import Foundation

public final class ExpenseService: ExpenseServiceProtocol {
    
    private let endpoint: URL
    private let network: NetworkManaging
    private let parser: ExpenseParserObjC

    public init(
        network: NetworkManaging = NetworkManager(),
        parser: ExpenseParserObjC = ExpenseParserObjC()
    ) {
        self.network = network
        self.parser = parser
        
        guard let url = URL(string: Constants.API.baseURL + Constants.API.expensesPath) else {
            fatalError("Invalid API URL in Constants.API")
        }
        self.endpoint = url
    }

    public func fetchExpenses() async throws -> [Expense] {
        var request = URLRequest(url: endpoint)
        request.httpMethod = "GET"
        request.timeoutInterval = Constants.API.timeout
        
        do {
            let (data, response) = try await network.data(for: request)
            
            // Validate HTTP status code
            guard let http = response as? HTTPURLResponse,
                  (200...299).contains(http.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                throw APIError.httpError(
                    statusCode: statusCode,
                    url: endpoint.absoluteString
                )
            }
            
            // Obj-C Parsing
            let raw = try parser.parse(data: data)
            guard let dictionaries = raw as? [[String: Any]] else {
                throw APIError.parsingFallbackFailed(reason: "Parser returned unexpected format")
            }
            
            // Convert parsed dictionaries into JSON for decoding
            let jsonData = try JSONSerialization.data(withJSONObject: dictionaries)
            
            // Decode
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                return try decoder.decode([Expense].self, from: jsonData)
            } catch {
                throw APIError.decodingError(error, url: endpoint.absoluteString)
            }

        } catch let apiError as APIError {
            throw apiError

        } catch {
            throw APIError.unknown(error)
        }
    }
}
