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
        
        placeService.getPlaces(with: coordinate) {[weak self] result in
            guard let self = self else { return }
            self.presentNextView()
            switch result {
            
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate.alert(message: "Something went wrong please try again")
                
            case .success(let places):
                
                print(places.count)
                self.presentNextView()
            }
            
            
        }
    }
    
    private func presentNextView() {
        let (nav, view) = PlacesNavigationControllerComposer.makeModule()
        view.presenter.list = places
        self.delegate.present(next: nav)
    }
}
