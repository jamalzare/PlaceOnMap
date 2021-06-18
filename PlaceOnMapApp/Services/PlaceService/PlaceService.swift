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
        
    }
    
    
}
