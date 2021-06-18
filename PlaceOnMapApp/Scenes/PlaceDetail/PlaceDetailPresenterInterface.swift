//
//  PlaceDetailPresenterInterface.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation

protocol PlaceDetailPresenterInterface {
    var place: Place? { get set }
    func viewDidLoad()
}
