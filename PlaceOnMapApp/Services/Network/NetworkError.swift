//
//  NetworkError.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/16/21.
//

import Foundation

public struct NetworkError: Error, LocalizedError {
    
    public let errorKind: ErrorKind
    public let identifier: String?
    
    public init(errorKind: NetworkError.ErrorKind, identifier: String?) {
        self.errorKind = errorKind
        self.identifier = identifier
    }
    
    public enum ErrorKind {
        case invalidUrl
        case connectionError
        case invalidRequest
        case invalidStatusCode(Int, Any? = nil)
        case invalidResponse(Data?)
    }
    
    public var errorDescription: String? {
        switch errorKind  {
        case .invalidUrl:
            return "Invalid URL"
        case .connectionError:
            return "Unable to complete. Check network status."
        case .invalidRequest:
            return "Invalid Request"
        case let .invalidStatusCode(statusCode, _):
            return "Invalid Response. Status Code: \(statusCode)"
            
        case let .invalidResponse(data):
            if let data = data {
                return String.init(data: data, encoding: .utf8)
            } else {
                return "No data"
            }
        }
    }
}

