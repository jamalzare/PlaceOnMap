//
//  PlaceServiceProvider.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation


protocol PlaceServiceProvider {
    
    func getPlaces(with coordinate: (lat: Double, long: Double), completion: @escaping (Result<[Place], Error>) -> Void)
}
