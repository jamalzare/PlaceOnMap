//
//  URLRequest+Ext.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation

extension URLRequest {
    
    static func createRequest(url: String,
                              type: String,
                              headers: [String: String]? = nil,
                              params: [String: Any]? = nil,
                              timeout:Int = 10) -> URLRequest {
        let uRL = URL(string: url)
        
        var urlRequest = URLRequest(url: uRL!)
        
        urlRequest.httpMethod = type
        
        if let headers = headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let body = params, type.lowercased() != "get" {
            
            let data = try! JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            urlRequest.httpBody = data
        }
        
        return urlRequest
    }
    
    func parse<T: Decodable>(response: Data) -> T? {
        
        do {
            let decoder = JSONDecoder()
            let responseModel = try decoder.decode(T.self, from: response) as T
            return responseModel
            
        } catch(let f) {
            print(f)
        }
        
        return nil
    }
    
    func parse<T: Decodable>(_: T.Type, response: Data) -> T? {
        
        do {
            let decoder = JSONDecoder()
            let responseModel = try decoder.decode(T.self, from: response)
            return responseModel
            
        } catch(let f) {
            print(f)
        }
        
        return nil
    }
}
