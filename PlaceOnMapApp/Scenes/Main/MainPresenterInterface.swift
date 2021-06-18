//
//  MainPresenterInterface.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation


protocol MainPresenterInterface {
    
    func locationDidSelect(with coordinate: (lat: Double, long: Double))
}
