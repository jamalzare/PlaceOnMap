//
//  PlaceDetailViewControllerComposer.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit

class PlaceDetailViewControllerComposer {
    
    static func makeModule() -> PlaceDetailViewController {

        let presenter = PlaceDetailPresenter()
        let controller = PlaceDetailViewController(presenter: presenter)
        presenter.delegate = controller
        
        return controller
    }
}
