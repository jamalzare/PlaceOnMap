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
        1
    }
    
    func numberOfRowsInSection(at index: Int) -> Int {
        return list.count
    }
    
    func model(at indexPath: IndexPath) -> Place {
        return list[indexPath.item]
    }
    
    func didSelect(item atIndexPath: IndexPath) {
        
        let view = PlaceDetailViewControllerComposer.makeModule()
        view.presenter.place = model(at: atIndexPath)
        delegate.navigateTo(next: view)
    }
    
}
