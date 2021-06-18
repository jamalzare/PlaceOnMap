//
//  MainPresenterDelegate.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit

protocol MainPresenterDelegate: class {
    
//    func presenterDidLoadPlaces(_: MainPresenterInterface, list: [Place], error: Error?, message: String?)
    
    func alert(message: String)
    func present(next view: UIViewController)
    func showPreloader()
    func dismissPreloader()
    
}
