//
//  WebApies.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation

struct WebApies {
    
    static let accessKey = "bbc483eb3694e077dc9bc15db2150954"
    static let host = "https://api.positionstack.com"
    static let apiVersion = "v1"
    static let path = "reverse"
    static let accessParameters = "?access_key=\(WebApies.accessKey)"
    
    static var baseUrl: String {
        return "\(host)/\(apiVersion)/\(path)"
    }
    
    static func getPlace(with coordinate: (lat: Double, long: Double))-> URLRequest {
        
        let query = "&query=\(coordinate.lat),\(coordinate.long)"
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url = baseUrl + accessParameters + query

        let request = URLRequest.createRequest(url: url,
                                               type: "GET"
                                               //headers: [],
                                               )
        
        return request
    }
    
}
