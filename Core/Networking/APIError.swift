//
//  APIError.swift
//  ExpenseViewer
//
//  Created by Ayesha Fatima on 25/11/25.
//

import Foundation

public enum APIError: Error, LocalizedError {
    case badURL(String) // include URL string
    case httpError(statusCode: Int, url: String?)
    case decodingError(Error, url: String?)
    case parsingFallbackFailed(reason: String)
    case unknown(Error)
    
    public var errorDescription: String? {
        switch self {
        case .badURL(let url):
            return "Bad URL: \(url)"
        case .httpError(let statusCode, let url):
            if let url = url {
                return "HTTP error \(statusCode) at URL: \(url)"
            } else {
                return "HTTP error \(statusCode)"
            }
        case .decodingError(let error, let url):
            if let url = url {
                return "Decoding error at URL \(url): \(error.localizedDescription)"
            } else {
                return "Decoding error: \(error.localizedDescription)"
            }
        case .parsingFallbackFailed(let reason):
            return "Parsing failed: \(reason)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}

