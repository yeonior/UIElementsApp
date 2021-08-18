//
//  TableViewVC.swift
//  UI Elements
//
//  Created by ruslan on 10.08.2021.
//

import UIKit

final class TableViewVC: UIViewController, TitleAndColorProvider {
    
    private var myTableView = UITableView()
    private let cellIdentifier = "myCell"
    
    private var emoji = [
        Emoji(emoji: "🥸", description: "Disquised Face", symbol: "face.smiling", isFavourite: false),
        Emoji(emoji: "🤠", description: "Cowboy Hat Face", symbol: "face.smiling", isFavourite: false),
        Emoji(emoji: "🤯", description: "Exploding Head", symbol: "face.smiling", isFavourite: false)
    ]
    private var flags = [
        Emoji(emoji: "🇨🇦", description: "Canada", symbol: "flag", isFavourite: false),
        Emoji(emoji: "🇨🇿", description: "Czech Republic", symbol: "flag", isFavourite: false),
        Emoji(emoji: "🇯🇵", description: "Japan", symbol: "flag", isFavourite: false)
    ]
    private var weather = [
        Emoji(emoji: "☀️", description: "Clear sky", symbol: "cloud", isFavourite: false),
        Emoji(emoji: "🌧", description: "Rain", symbol: "cloud", isFavourite: false),
        Emoji(emoji: "🌨", description: "Snow", symbol: "cloud", isFavourite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view configuring
    
    private func configureTableView() {
        
        myTableView = UITableView(frame: view.bounds, style: .grouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        myTableView.tableFooterView = UIView()
        
        // bar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editAction(_:)))
        
        // adding
        view.addSubview(myTableView)
    }
    
    // enabling table editing mode
    @objc private func editAction(_ sender: UIBarButtonItem) {
        guard sender == navigationItem.rightBarButtonItem else { return }
        
        if myTableView.isEditing {
            sender.title = "Edit"
            sender.setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 17)], for: .normal)
            myTableView.setEditing(false, animated: true)
        } else {
            sender.title = "Done"
            sender.setTitleTextAttributes([.font : UIFont.boldSystemFont(ofSize: 17)], for: .normal)
            myTableView.setEditing(true, animated: true)
        }
    }
}

// MARK: - Extensions

extension TableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Data source
    
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return emoji.count
        case 1: return flags.count
        case 2: return weather.count
        default: return 0
        }
    }
    
    // cells configuring
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = String(emoji[indexPath.row].description)
            cell.imageView?.image = UIImage(systemName: emoji[indexPath.row].symbol)
        case 1:
            cell.textLabel?.text = String(flags[indexPath.row].description)
            cell.imageView?.image = UIImage(systemName: flags[indexPath.row].symbol)
        case 2:
            cell.textLabel?.text = String(weather[indexPath.row].description)
            cell.imageView?.image = UIImage(systemName: weather[indexPath.row].symbol)
        default:
            break
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default
        
        return cell
    }
    
    // header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0: return "Emoji"
        case 1: return "Flags"
        case 2: return "Weather"
        default: return nil
        }
    }
    
    // permission to move rows
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // moving rows
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        var object = Emoji(emoji: "🚫", description: "N/A", symbol: "nosign", isFavourite: false)
        
        switch sourceIndexPath.section {
        case 0:
            if destinationIndexPath.row < emoji.endIndex {
                object = emoji.remove(at: sourceIndexPath.row)
                emoji.insert(object, at: destinationIndexPath.row)
            }
        case 1:
            if destinationIndexPath.row < flags.endIndex {
                object = flags.remove(at: sourceIndexPath.row)
                flags.insert(object, at: destinationIndexPath.row)
            }
        case 2:
            if destinationIndexPath.row < weather.endIndex {
                object = weather.remove(at: sourceIndexPath.row)
                weather.insert(object, at: destinationIndexPath.row)
            }
        default:
            break
        }
        tableView.reloadData()
    }
    
    // MARK: - Delegate
    
    // row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    // action by selecting a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        var emoji = ""
        var description = ""
        
        switch indexPath.section {
        case 0:
            emoji = self.emoji[indexPath.row].emoji
            description = self.emoji[indexPath.row].description
        case 1:
            emoji = self.flags[indexPath.row].emoji
            description = self.flags[indexPath.row].description
        case 2:
            emoji = self.weather[indexPath.row].emoji
            description = self.weather[indexPath.row].description
        default:
            break
        }
        
        let page = PageModel(emoji: emoji, description: description)
        navigationController?.pushViewController(MyPage(page: page), animated: true)
    }
    
    // leading swipe actions
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var object = Emoji(emoji: "🚫", description: "N/A", symbol: "nosign", isFavourite: false)
        
        switch indexPath.section {
        case 0: object = emoji[indexPath.row]
        case 1: object = flags[indexPath.row]
        case 2: object = weather[indexPath.row]
        default:
            break
        }
        
        // making cell favourite
        let favouriteAction = UIContextualAction(style: .normal, title: "Favourite") { [unowned self] _, _, completion in
            
//            let symbolString = object.symbol
//            let newSymbolString = object.symbol + ".fill"
            
            switch indexPath.section {
            case 0:
                object.isFavourite.toggle()
                object.symbol = object.isFavourite ? "face.smiling.fill" : "face.smiling"
                emoji[indexPath.row] = object
            case 1:
                object.isFavourite.toggle()
                object.symbol = object.isFavourite ? "flag.fill" : "flag"
                flags[indexPath.row] = object
            case 2:
                object.isFavourite.toggle()
                object.symbol = object.isFavourite ? "cloud.fill" : "cloud"
                weather[indexPath.row] = object
            default:
                break
            }
            
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(systemName: object.symbol)
            
            completion(true)
        }
        
        favouriteAction.backgroundColor = object.isFavourite ? #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        favouriteAction.image = object.isFavourite ? UIImage(systemName: "suit.heart.fill") : UIImage(systemName: "suit.heart")
        
        let configuration = UISwipeActionsConfiguration(actions: [favouriteAction])
        configuration.performsFirstActionWithFullSwipe = true
        
        return configuration
    }
    
    // trailing swipe actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // deleting cell
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] _, _, _ in
            
            switch indexPath.section {
            case 0:
                self.emoji.remove(at: indexPath.row)
            case 1:
                self.flags.remove(at: indexPath.row)
            case 2:
                self.weather.remove(at: indexPath.row)
            default:
                break
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // reducing the space between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 1 : 18
    }
}
