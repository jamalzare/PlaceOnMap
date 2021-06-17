//
//  PlacesPresenterInterface.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation

protocol PlacesPresenterInterface {
    
    var list: [Place] { get set }
    var numberOfSections: Int { get }
    
    func numberOfRowsInSection(at index: Int) -> Int
    
    func model(at indexPath: IndexPath) -> Place
    
    func didSelect(item atIndexPath: IndexPath)
    
}
