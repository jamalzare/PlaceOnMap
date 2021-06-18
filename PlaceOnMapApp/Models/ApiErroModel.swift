//
//  ApiErroModel.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation

struct ApiErroModelContextQuery: Decodable {
   
    let type: String
    let message: String
}

struct ApiErroModelContext: Decodable {
    let query: [ApiErroModelContextQuery]
}

struct ApiErroModel: Decodable {
    
    let code: String
    let message: String
    let context: ApiErroModelContext
    
}

struct GetPlacesApiErroModel: Decodable {
    
    let error: ApiErroModel
}
