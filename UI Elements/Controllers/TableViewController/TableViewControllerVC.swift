//
//  TableViewControllerVC.swift
//  UI Elements
//
//  Created by ruslan on 15.08.2021.
//

import UIKit

final class TableViewControllerVC: UITableViewController {
    
    private let cellIdentifier = "myCell"
    private lazy var someItems = ["Bread", "Milk", "Water", "Bananas"]
    private var list = [
        Item(name: "Sugar", isCheckmarked: false),
        Item(name: "Flour", isCheckmarked: false),
        Item(name: "Tomatoes", isCheckmarked: true),
        Item(name: "Chicken breast", isCheckmarked: false),
        Item(name: "Eggs", isCheckmarked: false),
        Item(name: "Potatoes", isCheckmarked: false),
        Item(name: "Cheese", isCheckmarked: false),
        Item(name: "Chocolate", isCheckmarked: true),
        Item(name: "Rice", isCheckmarked: false),
        Item(name: "Butter", isCheckmarked: false),
    ]
//    private var filteredList = [Item]()
//    private let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        title = "UITableViewController"
        view.backgroundColor = .systemBackground
        configureTableViewController()
    }
    
//    private func configureLabel() {
//        myLabel.frame = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 100, height: 50)
//        myLabel.text = "You have no items in your list"
//        myLabel.backgroundColor = .red
//        //        label.isHidden = true
//        tableView.addSubview(myLabel)
//    }
    
    // MARK: - Table view controller configuring
    
    private func configureTableViewController() {
        
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // bar buttons
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addButtonAction(_:)))
        navigationItem.rightBarButtonItems = [editButtonItem, addButton]
        
        // search comtroller
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = true
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = true
        
        // color
        tableView.backgroundColor = .systemGroupedBackground        
    }
    
    // adding a new cell
    @objc private func addButtonAction(_ sender: UIBarButtonItem) {
        guard sender == navigationItem.rightBarButtonItems?.last else { return }
        
        // alert controller creation and configuring
        let alertController = UIAlertController(title: "New item",
                                                message: "Add something you need to buy",
                                                preferredStyle: .alert)
        
        let addButton = UIAlertAction(title: "Add", style: .default) { [unowned self] _ in
            guard let itemName = alertController.textFields?.first?.text, itemName != "" else { return }
            self.list.append(Item(name: itemName, isCheckmarked: false))
            tableView.insertRows(at: [IndexPath(row: list.count - 1,
                                                section: tableView.numberOfSections - 1)],
                                 with: .automatic)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addButton)
        alertController.addAction(cancelButton)
        alertController.addTextField { [unowned self] textField in
            textField.placeholder = self.someItems.randomElement()
        }
        present(alertController, animated: true)
    }

    // MARK: - Table view data source
    
    // number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // MARK: Cell configuring
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.textLabel?.text = list[indexPath.row].name
        if list[indexPath.row].isCheckmarked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    // header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Shopping list"
    }
    
    // permission to edit rows
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // editing rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // deleting
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }   
    }

    // permission to move rows
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // moving rows
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let item = list.remove(at: fromIndexPath.row)
        list.insert(item, at: to.row)
        tableView.reloadData()
    }
    
    // MARK: - Delegate
    
    // action by selecting a row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if cell.accessoryType == UITableViewCell.AccessoryType.checkmark {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
    }
    
//    //
//    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if tableView.numberOfRows(inSection: 0) == 0 {
//            UIView.animate(withDuration: 0.5) {
//                tableView.headerView(forSection: 0)?.textLabel?.text = "Shopping list is empty"
//            }
//        } else if tableView.numberOfRows(inSection: 0) == 1 {
//            tableView.headerView(forSection: 0)?.textLabel?.text = "Shopping list"
//        }
//    }
}

//extension TableViewControllerVC: UISearchResultsUpdating {
//
//    func updateSearchResults(for searchController: UISearchController) {
//
//    }
//}
