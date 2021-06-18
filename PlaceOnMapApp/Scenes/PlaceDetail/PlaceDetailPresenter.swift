//
//  PlaceDetailPresenter.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation

class PlaceDetailPresenter: PlaceDetailPresenterInterface {
    
    var place: Place?
    
    weak var delegate: PlaceDetailPresenterDelegate!
    
    func viewDidLoad() {
        if let place = place {
            delegate.set(model: place)
        }
    }
    
    
}
