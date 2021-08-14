//
//  TableViewVC.swift
//  UI Elements
//
//  Created by ruslan on 10.08.2021.
//

import UIKit

final class TableViewVC: UIViewController {
    
    private var myTableView = UITableView()
    private let cellIdentifier = "myCell"
    
    private var emoji = [
        Emoji(emoji: "🥸", description: "Disquised Face", isFavourite: false),
        Emoji(emoji: "🤠", description: "Cowboy Hat Face", isFavourite: false),
        Emoji(emoji: "🤯", description: "Exploding Head", isFavourite: false)
    ]
    private var flags = [
        Emoji(emoji: "🇨🇦", description: "Canada", isFavourite: false),
        Emoji(emoji: "🇨🇿", description: "Czech Republic", isFavourite: false),
        Emoji(emoji: "🇯🇵", description: "Japan", isFavourite: false)
    ]
    private var weather = [
        Emoji(emoji: "☀️", description: "Clear sky", isFavourite: false),
        Emoji(emoji: "🌧", description: "Rain", isFavourite: false),
        Emoji(emoji: "🌨", description: "Snow", isFavourite: false)
    ]
    
    private var emojiSymbolString = "face.smiling"
    private var flagSymbolString = "flag"
    private var weatherSymbolString = "cloud"
    
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
        
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        myTableView.tableFooterView = UIView()
        
        // color
        myTableView.backgroundColor = .systemBackground
        
        // adding
        view.addSubview(myTableView)
    }
}

// MARK: - Table view delegate and data source

extension TableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    // data source
    
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
    
    // MARK: Cell configuring
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = String(emoji[indexPath.row].description)
            cell.imageView?.image = UIImage(systemName: emojiSymbolString)
        case 1:
            cell.textLabel?.text = String(flags[indexPath.row].description)
            cell.imageView?.image = UIImage(systemName: flagSymbolString)
        case 2:
            cell.textLabel?.text = String(weather[indexPath.row].description)
            cell.imageView?.image = UIImage(systemName: weatherSymbolString)
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
    
    // delegate
    
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
        
        let page = PageHelper(emoji: emoji, description: description)
        navigationController?.pushViewController(PageVC(page: page), animated: true)
    }
    
    // leading swipe actions
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var object = Emoji(emoji: "🚫", description: "N/A", isFavourite: false)
        
        switch indexPath.section {
        case 0: object = emoji[indexPath.row]
        case 1: object = flags[indexPath.row]
        case 2: object = weather[indexPath.row]
        default:
            break
        }
        
        // making cell favourite
        let favouriteAction = UIContextualAction(style: .normal, title: "Favourite") { [unowned self] _, _, completion in
            
            var symbolString: String? = "nosign"
            var newSymbolString: String? = "nosign"
            
            switch indexPath.section {
            case 0:
                symbolString = self.emojiSymbolString
                newSymbolString = self.emojiSymbolString + ".fill"
                object.isFavourite.toggle()
                emoji[indexPath.row] = object
            case 1:
                symbolString = self.flagSymbolString
                newSymbolString = self.flagSymbolString + ".fill"
                object.isFavourite.toggle()
                flags[indexPath.row] = object
            case 2:
                symbolString = self.weatherSymbolString
                newSymbolString = self.weatherSymbolString + ".fill"
                object.isFavourite.toggle()
                weather[indexPath.row] = object
            default:
                break
            }
            
            guard let symbolString = symbolString, let newSymbolString = newSymbolString else { return }
            tableView.cellForRow(at: indexPath)?.imageView?.image = object.isFavourite ? UIImage(systemName: newSymbolString) : UIImage(systemName: symbolString)
            
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
}
