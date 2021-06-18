//
//  PlaceService.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation

class PlaceService: PlaceServiceProvider {
    
    let networkLoader: NetworkLoaderProvider
    
    init(networkLoader: NetworkLoaderProvider) {
        self.networkLoader = networkLoader
    }
    
    func getPlaces(with coordinate: (lat: Double, long: Double), completion: @escaping (Result<[Place], Error>) -> Void) {
        
        let request = WebApies.getPlace(with: coordinate)

        networkLoader.loadRequest(request: request,
                        identifier: "get places",
                        timeout: 20) { result in
            
            switch result {
            
            case .failure(let error):
                completion(Result.failure(error))
                return
                
            case .success(let response):
                
                guard let model: [Place] = request.parse(response: response.data) else {
                    completion(Result.failure(
                                NetworkError(errorKind: .invalidResponse(response.data), identifier: nil)))
                    return
                }
                
                completion(Result.success(model))
            }
        }

    }
    
    
}
