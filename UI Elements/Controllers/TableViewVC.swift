//
//  TableViewVC.swift
//  UI Elements
//
//  Created by ruslan on 10.08.2021.
//

import UIKit

final class TableViewVC: UIViewController {
    
    private var myTableView = UITableView()
    private var myArray = [1, 2, 3, 4, 5]
    private let cellIdentifier = "myCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UITableView"
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    private func configureTableView() {
        
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = .systemBackground
        
        view.addSubview(myTableView)
    }
}

extension TableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let text = myArray[indexPath.row]
        cell.textLabel?.text = String(text)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
}
