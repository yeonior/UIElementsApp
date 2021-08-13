//
//  TableViewVC.swift
//  UI Elements
//
//  Created by ruslan on 10.08.2021.
//

import UIKit

final class TableViewVC: UIViewController {
    
    private var myTableView = UITableView()
    private var myArray = ["🥸", "🤠", "🤩", "🤯", "🤐"]
    private let cellIdentifier = "myCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UITableView"
        view.backgroundColor = .systemBackground
        configureTableView()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    // MARK: - Table view configuring
    
    private func configureTableView() {
        
        // attributes
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // color
        myTableView.backgroundColor = .systemBackground
        
        // adding
        view.addSubview(myTableView)
    }
}

// MARK: - Table view delegate and data source

extension TableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    // data source
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myArray.count
    }
    
    // MARK: Cell configuring
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let text = myArray[indexPath.row]
        cell.textLabel?.text = String(text)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
}
