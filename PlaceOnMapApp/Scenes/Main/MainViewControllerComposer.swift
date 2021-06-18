//
//  MainViewControllerComposer.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit

class MainViewControllerComposer {
    
    static func makeModule() -> MainViewController {

        let networkLoader = NetworkLoader()
        let service = PlaceService(networkLoader: networkLoader)
        let presenter = MainPresenter(placeService: service)
        let preloader = Preloader()
        let controller = MainViewController(presenter: presenter, preloader: preloader)
        
        presenter.delegate = controller
        
        return controller
    }
}
