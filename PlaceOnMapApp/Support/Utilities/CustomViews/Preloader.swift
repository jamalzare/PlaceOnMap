//
//  Preloader.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/18/21.
//

import UIKit


class Preloader: PreloaderProvider {
    
    weak var view: UIView?
    var loadingView: UIView
    let messageLabel = UILabel()
    
    init() {
        loadingView = UIView()
    }
    
    
    func showLoading(on view: UIView, message: String) {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else { return }
            
            self.view = view
            
            
            self.loadingView.backgroundColor     = .clear
//            self.loadingView.alpha                 = 0
            view.addSubview(self.loadingView)
            
            
            self.loadingView.alignToSuperView(centerX: 0, centerY: 0, equalWidthRatio: 1, equalHeightRatio: 1)
            self.loadingView.layer.zPosition = 111
            view.bringSubviewToFront(self.loadingView)
            
            //Activity Indicaator View
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.style = .whiteLarge
            activityIndicator.startAnimating()
            self.loadingView.addSubview(activityIndicator)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                activityIndicator.centerXAnchor.constraint(equalTo: self.loadingView.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: self.loadingView.centerYAnchor)
            ])
        
            let dimColor = UIColor(white: 0, alpha: 0.5)
            
            UIView.animate(withDuration: 0.25) {
                //self.loadingView.alpha = 0.9
                self.loadingView.backgroundColor = dimColor
            }
            
            //Message Lable
            self.messageLabel.text = message
            self.messageLabel.textAlignment = .center
            self.messageLabel.textColor = .white
            
            self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
            self.loadingView.addSubview(self.messageLabel)
            
            NSLayoutConstraint.activate([
            
                self.messageLabel.centerXAnchor.constraint(equalTo: self.loadingView.centerXAnchor),
                self.messageLabel.leadingAnchor.constraint(equalTo: self.loadingView.leadingAnchor, constant: 16),
                self.messageLabel.trailingAnchor.constraint(equalTo: self.loadingView.trailingAnchor, constant: -16),
                self.messageLabel.bottomAnchor.constraint(equalTo: activityIndicator.topAnchor, constant: -16)
            ])
        }
    }
    
    func dismissLoading() {
        DispatchQueue.main.async {
            self.loadingView.removeFromSuperview()
        }
    }
    
}
