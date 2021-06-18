//
//  PlacesViewController.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation
import UIKit

class PlacesViewController: UITableViewController {
    
    var presenter: PlacesPresenterInterface
    
    private let cellId = "cellId"
    
    init(presenter: PlacesPresenterInterface) {
        
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        title = Strings.placesTitle
        
        let dismissBtn = UIBarButtonItem()
        dismissBtn.title = Strings.dismiss
        navigationItem.leftBarButtonItem = dismissBtn
        dismissBtn.target = self
        dismissBtn.action = #selector(dismissBtnDidTap)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc func dismissBtnDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PlacesViewController: PlacesPresenterDelegate {
    
    func navigateTo(next view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
    
}

extension PlacesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections 
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection(at: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = presenter.model(at: indexPath).name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(item: indexPath)
    }
    
}
