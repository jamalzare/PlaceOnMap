//
//  NetworkLoaderProvider.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/16/21.
//

import Foundation

protocol NetworkLoaderProvider {
    
    typealias Response = (data: Data, identifier: String?)
    
    typealias Completion = (Result<Response, NetworkError>) -> Void
    
    func loadRequest(request: URLRequest, identifier: String?, timeout: Double, completion: Completion?)
}
