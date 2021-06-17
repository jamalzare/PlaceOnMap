//
//  MainPresenter.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit

class MainPresenter: MainPresenterInterface {
    
    let placeService: PlaceServiceProvider
    weak var delegate: MainPresenterDelegate!
    
    init(placeService: PlaceServiceProvider) {
        
        self.placeService = placeService
    }
    
    func locationDidSelect(with coordinate: (lat: Double, long: Double)) {
        
        placeService.getPlaces(with: coordinate) {[weak self] _ in
            guard let self = self else { return }
            self.delegate.present(next: UIViewController())
        }
    }
}
