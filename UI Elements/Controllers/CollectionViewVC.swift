//
//  CollectionViewVC.swift
//  UI Elements
//
//  Created by ruslan on 17.08.2021.
//

import UIKit

final class CollectionViewVC: UIViewController, TitleAndColorProvider {
    
    private var myCollectionView: UICollectionView?
    static let menu: [CategoryModel] = [
        CategoryModel(name: "Drinks", imageName: "soft-drink",
                      productArray: [
                        ProductModel(name: "Water", imageName: "soft-drink", price: 2),
                        ProductModel(name: "Soft Drink", imageName: "soft-drink", price: 2),
                        ProductModel(name: "Latte", imageName: "drink", price: 4),
                        ProductModel(name: "Cappuccino", imageName: "drink", price: 4),
                        ProductModel(name: "Black Tea", imageName: "drink", price: 3),
                        ProductModel(name: "Green Tea", imageName: "drink", price: 3)
                      ]),
        CategoryModel(name: "Main meals", imageName: "burger",
                      productArray: [
                        ProductModel(name: "Burger", imageName: "burger", price: 4),
                        ProductModel(name: "Double Burger", imageName: "double-burger", price: 7),
                        ProductModel(name: "Sandwich", imageName: "sandwich", price: 3),
                        ProductModel(name: "Burrito", imageName: "burrito", price: 4),
                        ProductModel(name: "Pizza", imageName: "pizza", price: 10)
                      ]),
        CategoryModel(name: "Chicken", imageName: "chicken-leg",
                      productArray: [
                        ProductModel(name: "Nuggets", imageName: "nuggets", price: 4),
                        ProductModel(name: "Chicken Wings", imageName: "chicken-wing", price: 5),
                        ProductModel(name: "Chicken Legs", imageName: "chicken-leg", price: 9)
                      ]),
        CategoryModel(name: "Snacks", imageName: "french-fries",
                      productArray: [
                        ProductModel(name: "French Fries", imageName: "french-fries", price: 2),
                        ProductModel(name: "Onion Rings", imageName: "onion-rings", price: 3)
                      ]),
        CategoryModel(name: "Fish", imageName: "fish-and-chips",
                      productArray: [
                        ProductModel(name: "Fish and Chips", imageName: "fish-and-chips", price: 7)
                      ]),
        CategoryModel(name: "Desserts", imageName: "muffin",
                      productArray: [
                        ProductModel(name: "Muffin", imageName: "muffin", price: 2),
                        ProductModel(name: "Donut", imageName: "donut", price: 1),
                        ProductModel(name: "Cupcake", imageName: "cupcake", price: 3),
                        ProductModel(name: "Waffle", imageName: "waffle", price: 3),
                        ProductModel(name: "Cake", imageName: "cake", price: 4),
                        ProductModel(name: "Ice Cream", imageName: "ice-cream", price: 4),
                        ProductModel(name: "Milkshake", imageName: "milkshake", price: 5)
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
        layout.minimumLineSpacing = MainCellSizeConstants.minimumLineSpacing
//        layout.itemSize = CGSize(width: (view.frame.width / 4) - 5, height: (view.frame.width / 4) - 5)
        
        // init and insets
        myCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        myCollectionView?.contentInset = UIEdgeInsets(top: 0,
                                                      left: MainCellSizeConstants.distanceToBorder,
                                                      bottom: 0,
                                                      right: MainCellSizeConstants.distanceToBorder)
        
        guard let collectionView = myCollectionView else { return }
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.identifier)
        
        // protocols
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // attributes
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        // adding
        view.addSubview(collectionView)
    }
}

// MARK: - Collection view protocols

extension CollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Data source
    
    // number of section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionViewVC.menu.count
    }
    
    // MARK: Cell configuring
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifier, for: indexPath) as? MainCell {
            
            cell.setUpData(labelText: CollectionViewVC.menu[indexPath.item].name,
                           imageName: CollectionViewVC.menu[indexPath.item].imageName,
                           array: CollectionViewVC.menu[indexPath.item].productArray)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    // MARK: - Delegate
    
    // pushing a specific view controller and making items highlightable
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let item = collectionView.cellForItem(at: indexPath) as? MainCell {
            item.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                UIView.animate(withDuration: 1.0) {
                    item.alpha = 1.0
                }
            }
        }
        
        let vc = CategoryPage(title: CollectionViewVC.menu[indexPath.item].name,
                              backgroundColor: .systemBackground,
                              productArray: CollectionViewVC.menu[indexPath.item].productArray)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // making items highlightable
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let item = collectionView.cellForItem(at: indexPath) as? MainCell {
            item.alpha = 0.5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let item = collectionView.cellForItem(at: indexPath) as? MainCell {
            item.alpha = 1.0
        }
    }
    
    // MARK: - Flow layout delegate
    
    // size for each item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: MainCellSizeConstants.itemWidth,
                      height: collectionView.frame.height * 0.5)
    }
}
