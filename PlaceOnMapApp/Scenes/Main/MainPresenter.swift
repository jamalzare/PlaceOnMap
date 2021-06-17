//
//  MainPresenter.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit

let places = [
    
    Place(name: "Washington"),
    Place(name: "Los Angeles"),
    Place(name: "Coupertino"),
    Place(name: "Sillicon valley"),
]

class MainPresenter: MainPresenterInterface {
    
    let placeService: PlaceServiceProvider
    weak var delegate: MainPresenterDelegate!
    
    
    init(placeService: PlaceServiceProvider) {
        
        self.placeService = placeService
    }
    
    func locationDidSelect(with coordinate: (lat: Double, long: Double)) {
        
        let (nav, view) = PlacesNavigationControllerComposer.makeModule()
        view.presenter.list = places
        self.delegate.present(next: nav)
        return
        placeService.getPlaces(with: coordinate) {[weak self] _ in
            guard let self = self else { return }
            let view = PlacesNavigationControllerComposer.makeModule().0
            self.delegate.present(next: view)
        }
    }
}
