//
//  PlaceDetailViewController.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import UIKit

class PlaceDetailViewController: UIViewController {
    
    var presenter: PlaceDetailPresenterInterface
    
    private let label: UILabel = UILabel()
    
    
    init(presenter: PlaceDetailPresenterInterface) {
        
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        design()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setup() {
        
        view.addSubViews(label)
        let dismissBtn = UIBarButtonItem()
        dismissBtn.title = Strings.dismiss
       // navigationItem.leftBarButtonItem = dismissBtn
        
        dismissBtn.target = self
      //  dismissBtn.action = #selector(dismissBtnDidTap)
        
        
        
    }
    
    private func design() {
        
        view.backgroundColor = .white
        view.tintColor = .systemBlue
    }
    
    @objc func betBack() {
        
        
    }
    
}

extension PlaceDetailViewController: PlaceDetailPresenterDelegate {
    
    func set(model: Place) {
        title = model.name
        label.text = model.name
    }
    
}
