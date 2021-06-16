//
//  ViewController.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/16/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.addSubview(mapView)
        mapView.alignToSuperView(fillWithPadding: 0)
    }


}

