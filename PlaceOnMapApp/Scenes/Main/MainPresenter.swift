//
//  MainPresenter.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit
import CoreLocation

class MainPresenter: MainPresenterInterface {
    
    let placeService: PlaceServiceProvider
    weak var delegate: MainPresenterDelegate!
    
    private var next: (UINavigationController, PlacesViewController)?
    
    init(placeService: PlaceServiceProvider) {
        
        self.placeService = placeService
    }
    
    func viewDidLoad() {
        if !CLLocationManager.locationServicesEnabled() {
            delegate.alert(message: "Please check your Location service and your net connection")
        }
    }
    
    func locationDidSelect(with coordinate: (lat: Double, long: Double)) {
        
        self.delegate.showPreloader()
        
        placeService.getPlaces(with: coordinate) { result in
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.delegate.dismissPreloader()
                
                self.presentNextView()
                switch result {
                
                case .failure(let error):
                    print(error.localizedDescription)
                    self.delegate.alert(message: "Something went wrong please check your connection or try later")
                    
                case .success(let places):
                    
                    print(places.count)
                    self.presentNextView()
                }
                
            }
        }
    }
    
    private func presentNextView() {
        
        if next == nil {
            next = PlacesNavigationControllerComposer.makeModule()
        }
        
        if let (nav, view) = next {
            
            view.presenter.list = places
            self.delegate.present(next: nav)
        }
    }
}
