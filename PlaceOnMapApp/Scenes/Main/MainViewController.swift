//
//  ViewController.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/16/21.
//

import UIKit
import MapKit

class MainViewController: UIViewController {
    
    let presenter: MainPresenterInterface
    let preloader: PreloaderProvider
    
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
    
    
    init(presenter: MainPresenterInterface,
         preloader: PreloaderProvider) {
        
        self.presenter = presenter
        self.preloader = preloader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        design()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        
        let coordinate = (lat: mapView.centerCoordinate.latitude, long: mapView.centerCoordinate.longitude)
        presenter.locationDidSelect(with: coordinate)
    }
    
}

extension MainViewController: MainPresenterDelegate {
    
    func alert(message: String) {
        
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Strings.ok, style: .default){ _ in }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
           
    }
    
    func present(next view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
    
    func showPreloader() {
        preloader.showLoading(on: view, message: "Loading...")
    }
    
    func dismissPreloader() {
        preloader.dismissLoading()
    }
}

