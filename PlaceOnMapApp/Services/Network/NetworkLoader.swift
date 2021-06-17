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
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeout
        let urlSession = URLSession(configuration: configuration)
        
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            
            self.completionHandler(data: data,
                                   response: response,
                                   error: error,
                                   completion: completion,
                                   identifier: identifier)
        }
        
        task.resume()
        
        // XCTAssertEqual(result, .success(data))
    }
    
    public func completionHandler(data:Data?, response: URLResponse?, error: Error?, completion: Completion?, identifier: String?) {
        
        guard error == nil else {
            completion?(Result.failure(NetworkError(errorKind: .connectionError, identifier: identifier)))
            return
        }
        
        if let response = response as? HTTPURLResponse, response.statusCode != 200  {
            
            completion?(Result.failure(NetworkError(
                                        errorKind: .invalidStatusCode(response.statusCode, data),
                                        identifier: identifier)))
           
            print("error \(response.url?.path ?? ""): \(response.statusCode)")
            return
        }
        
        guard let data = data else {
            completion?(Result.failure(NetworkError(
                                        errorKind: .invalidResponse(nil),
                                        identifier: identifier)))
            return
        }
        
        completion?(Result.success((data, identifier)))
    }
}
