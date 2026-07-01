//
//  View.swift
//  VIPER
//
//  Created by Neosoft on 26/06/26.
//

import Foundation
import UIKit

// View Controller
// Protocol
// Reference to Presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with product: Products)
    func updateWithError(with error: String)
    
}

class ProductViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {
    var presenter: (any AnyPresenter)?
    
    private var tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //table.isHidden = true
        return table
    }()
    
    var products: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func update(with product: Products) {
        print("Got product")
        
        DispatchQueue.main.async {
            self.products = product
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func updateWithError(with error: String) {
        print(error)
    }
    
    // Table view Function
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return products?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = products?.products[indexPath.row].title
        return cell
    }
    
    
}


