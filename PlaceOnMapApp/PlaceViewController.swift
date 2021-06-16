//
//  ViewController.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/16/21.
//

import UIKit
import MapKit

class PlaceViewController: UIViewController {
    
    private let mapView = MKMapView()
    private let pinViewWidth: CGFloat = 40
    private let confirmBtnHeight: CGFloat = 40
    
    private let pinImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = Images.pin
        return iv
    }()
    
    private let confirmBtn: UIButton  = {
        
        let btn = UIButton()
        btn.setTitle(Strings.confirm, for: .normal)
        btn.addTarget(self, action: #selector(confirmBtnDidTap), for: .touchUpInside)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        design()
    }
    
    private func setup() {
        
        view.addSubViews(mapView, confirmBtn, pinImageView)
        
        mapView.alignToSuperView(fillWithPadding: 0)
        pinImageView.alignToSuperView(width: pinViewWidth, height: pinViewWidth, centerX: 0, centerY: 0)
        confirmBtn.alignToSuperView(bottom: 60, width: 200, height: confirmBtnHeight, centerX: 0)
        
    }
    
    private func design() {
        
        view.tintColor = .systemBlue
        pinImageView.layer.cornerRadius = pinViewWidth/2
        confirmBtn.layer.cornerRadius = confirmBtnHeight/2
    }
    
    @objc func confirmBtnDidTap() {
        
        print("lat:\(mapView.centerCoordinate.latitude) long:\(mapView.centerCoordinate.longitude)")
     
    }
    
    
}

