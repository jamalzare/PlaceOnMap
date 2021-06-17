//
//  MainPresenterDelegate.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit

protocol MainPresenterDelegate: class {
    
    func alert(message: String)
    func present(next view: UIViewController)
    
}
