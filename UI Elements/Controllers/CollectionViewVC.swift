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
        ProductCategory(name: "Drinks", imageName: "soft-drink",
                        productArray: [
                             Product(name: "Water", imageName: "soft-drink", price: 2),
                             Product(name: "Soft Drink", imageName: "soft-drink", price: 2),
                             Product(name: "Latte", imageName: "drink", price: 4),
                             Product(name: "Cappuccino", imageName: "drink", price: 4),
                             Product(name: "Black Tea", imageName: "drink", price: 3),
                             Product(name: "Green Tea", imageName: "drink", price: 3)
                        ]),
        ProductCategory(name: "Main meals", imageName: "burger",
                        productArray: [
                            Product(name: "Burger", imageName: "burger", price: 4),
                            Product(name: "Double Burger", imageName: "double-burger", price: 7),
                            Product(name: "Sandwich", imageName: "sandwich", price: 3),
                            Product(name: "Hot-Dog", imageName: "hot-dog", price: 3),
                            Product(name: "Burrito", imageName: "burrito", price: 4),
                            Product(name: "Pizza", imageName: "pizza", price: 10)
                        ]),
        ProductCategory(name: "Snacks", imageName: "french-fries",
                        productArray: [
                            Product(name: "French Fries", imageName: "french-fries", price: 2),
                            Product(name: "Onion Rings", imageName: "onion-rings", price: 3),
                            Product(name: "Nuggets", imageName: "nuggets", price: 4),
                            Product(name: "Chicken Wings", imageName: "chicken-wing", price: 5),
                            Product(name: "Chicken Legs", imageName: "chicken-leg", price: 9),
                            Product(name: "Fish and Chips", imageName: "fish-and-chips", price: 7)
                        ]),
        ProductCategory(name: "Desserts", imageName: "muffin",
                        productArray: [
                            Product(name: "Muffin", imageName: "muffin", price: 2),
                            Product(name: "Donut", imageName: "donut", price: 1),
                            Product(name: "Cupcake", imageName: "cupcake", price: 3),
                            Product(name: "Waffle", imageName: "waffle", price: 3),
                            Product(name: "Ice Cream", imageName: "ice-cream", price: 4),
                            Product(name: "Milkshake", imageName: "milkshake", price: 5)
                        ])
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
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = cellSizeConstants.minimumLineSpacing
//        layout.itemSize = CGSize(width: (view.frame.width / 4) - 5, height: (view.frame.width / 4) - 5)
        
        // init and size
        let bounds = view.bounds
        let frame = CGRect(x: bounds.origin.x,
                           y: bounds.origin.y,
                           width: bounds.width,
                           height: bounds.width)
        myCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        myCollectionView?.center = view.center
        myCollectionView?.contentInset = UIEdgeInsets(top: 0,
                                                      left: cellSizeConstants.distanceToBorder,
                                                      bottom: 0,
                                                      right: cellSizeConstants.distanceToBorder)
        
        guard let collectionView = myCollectionView else { return }
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.identifier)
        
        // protocols
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // attributes
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(collectionView)
    }
}

// MARK: - Collection view protocols

extension CollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Data source
    
    // number of section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    // MARK: Cell configuring
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.identifier, for: indexPath) as? MyCell {
            
            cell.setUpData(labelText: menu[indexPath.item].name,
                           imageName: menu[indexPath.item].imageName,
                           array: menu[indexPath.item].productArray)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    // MARK: - Delegate
    
    // action by selecting an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item)
    }
    
    // MARK: - Flow layout delegate
    
    // size for each item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellSizeConstants.itemWidth, height: collectionView.frame.height * 0.9)
    }
}
