//
//  CollectionViewVC.swift
//  UI Elements
//
//  Created by ruslan on 17.08.2021.
//

import UIKit

final class CollectionViewVC: UIViewController, TitleAndColorProvider {
    
    private var myCollectionView: UICollectionView?
    private let menu: [ProductCategory] = [
        ProductCategory(name: "Drinks", imageName: ""),
        ProductCategory(name: "Desserts", imageName: ""),
        ProductCategory(name: "Salads", imageName: ""),
        ProductCategory(name: "Meals", imageName: ""),
        ProductCategory(name: "Drinks", imageName: ""),
        ProductCategory(name: "Desserts", imageName: ""),
        ProductCategory(name: "Salads", imageName: ""),
        ProductCategory(name: "Meals", imageName: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    required init(title: String, backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Collection view configuring
    
    private func configureCollectionView() {
        
        // layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 40
        layout.itemSize = CGSize(width: (view.frame.width / 4) - 5, height: (view.frame.width / 4) - 5)
        
        // init
        myCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        guard let collectionView = myCollectionView else { return }
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        // protocols
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // attributes
        collectionView.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
    }
}

// MARK: - Collection view delegate and datasource

extension CollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // number of section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    // MARK: Cell configuring
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell {
            
            cell.configure(labelText: "House #\(indexPath.row + 1)", imageName: "house.fill")
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
