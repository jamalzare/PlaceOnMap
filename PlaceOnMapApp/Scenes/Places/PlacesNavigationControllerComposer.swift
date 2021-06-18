//
//  PlacesNavigationControllerComposer.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//


import UIKit

class PlacesNavigationControllerComposer {
    
    static func makeModule() -> (nav: UINavigationController, view: PlacesViewController) {

        let navigationControlller = UINavigationController()
        
        let presenter = PlacesPresenter()
        let viewController = PlacesViewController(presenter: presenter)
        presenter.delegate = viewController
        
        navigationControlller.viewControllers = [viewController]
        navigationControlller.navigationBar.prefersLargeTitles = true
        
        return (navigationControlller, viewController)
    }
}
