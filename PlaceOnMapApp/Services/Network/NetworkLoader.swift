//
//  NetworkLoader.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/16/21.
//

import Foundation

public class NetworkLoader: NetworkLoaderProvider {
    
    public init() {}
    
    public typealias Response = (data: Data, identifier: String?)
    
    public typealias Completion = (Result<Response, NetworkError>) -> Void
    
    public func loadRequest(request: URLRequest, identifier: String?, timeout: Double, completion: Completion?) {
        
    }
    
}
