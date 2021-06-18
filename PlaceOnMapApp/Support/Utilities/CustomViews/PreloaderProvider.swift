//
//  PreloaderProvider.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/18/21.
//

import UIKit


protocol PreloaderProvider {
    
    func showLoading(on view: UIView, message: String)
    
    func dismissLoading()
}
