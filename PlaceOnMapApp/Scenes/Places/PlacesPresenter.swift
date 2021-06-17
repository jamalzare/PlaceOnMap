//
//  PlacesPresenter.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit

class PlacesPresenter: PlacesPresenterInterface {
    
    var list: [Place] = []
    weak var delegate: PlacesPresenterDelegate!
    
    var numberOfSections: Int {
        0
    }
    
    func numberOfRowsInSection(at index: Int) -> Int {
        return list.count
    }
    
    func model(at indexPath: IndexPath) -> Place {
        return list[indexPath.item]
    }
    
    func didSelect(place: Place) {
        delegate.navigateTo(next: UIViewController())
    }
    
}
