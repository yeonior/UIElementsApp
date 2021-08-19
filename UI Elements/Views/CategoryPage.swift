//
//  CategoryPage.swift
//  UI Elements
//
//  Created by ruslan on 19.08.2021.
//

import UIKit

class CategoryPage: UIViewController {
    
    private var myCollectionView: UICollectionView?
    private var productArray = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    required init(title: String, backgroundColor: UIColor, productArray: [ProductModel]) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
        self.productArray = productArray
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
        layout.minimumLineSpacing = CategoryCellSizeConstants.minimumLineSpacing
//        layout.itemSize = CGSize(width: (view.frame.width / 4) - 5, height: (view.frame.width / 4) - 5)
        
        // init and size
        let bounds = view.bounds
        let frame = CGRect(x: bounds.origin.x,
                           y: bounds.origin.y,
                           width: CategoryCellSizeConstants.itemWidth * 2 + CategoryCellSizeConstants.distanceToBorder * 2 + CategoryCellSizeConstants.minimumLineSpacing,
                           height: CategoryCellSizeConstants.itemWidth * 3 + CategoryCellSizeConstants.distanceToBorder * 2 + CategoryCellSizeConstants.minimumLineSpacing * 2)
        myCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        myCollectionView?.center = view.center
        myCollectionView?.contentInset = UIEdgeInsets(top: CategoryCellSizeConstants.distanceToBorder,
                                                      left: CategoryCellSizeConstants.distanceToBorder,
                                                      bottom: CategoryCellSizeConstants.distanceToBorder,
                                                      right: CategoryCellSizeConstants.distanceToBorder)
        
        guard let collectionView = myCollectionView else { return }
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        
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

extension CategoryPage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Data source
    
    // number of section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productArray.count
    }
    
    // MARK: Cell configuring
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell {
            
            cell.setUpData(labelText: productArray[indexPath.item].name,
                           imageName: productArray[indexPath.item].imageName,
                           cost: productArray[indexPath.item].price)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    // MARK: - Delegate
    
    // action by selecting an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Flow layout delegate
    
    // size for each item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CategoryCellSizeConstants.itemWidth,
                      height: CategoryCellSizeConstants.itemWidth)
    }
}
