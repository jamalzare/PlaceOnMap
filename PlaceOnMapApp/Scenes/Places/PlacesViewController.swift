//
//  PlacesViewController.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/17/21.
//

import Foundation
import UIKit

class PlacesViewController: UITableViewController {
    
    let presenter: PlacesPresenterInterface
    
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
        view.backgroundColor = .yellow
        tableView.backgroundColor = .red
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
        cell.backgroundColor = UIColor.white
        return cell
    }
}
