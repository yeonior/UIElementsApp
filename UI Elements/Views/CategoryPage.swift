//
//  CategoryPage.swift
//  UI Elements
//
//  Created by ruslan on 19.08.2021.
//

import UIKit

final class CategoryPage: UIViewController {
    
    private var myCollectionView: UICollectionView?
    private var productArray = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    // updating collection view content insets
    override func viewDidLayoutSubviews() {
        guard let collectionView = myCollectionView else { return }
        
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let coef = CGFloat(round(Double(numberOfItems) / 2.0))
        let height = CategoryCellSizeConstants.itemWidth * coef + CategoryCellSizeConstants.minimumLineSpacing * (coef - 1.0)
        var topAndBottomDistance = (view.bounds.height - statusBarHeight - navigationBarHeight - bottomSafeAreaHeight - height) / 2
        var leftAndRightDistance = CategoryCellSizeConstants.distanceToBorder
        
        if numberOfItems > 6 {
            topAndBottomDistance = CategoryCellSizeConstants.distanceToBorder
        } else if numberOfItems == 1 {
            leftAndRightDistance = (view.bounds.width - CategoryCellSizeConstants.itemWidth - CategoryCellSizeConstants.minimumLineSpacing) / 2
        }
        
        collectionView.contentInset = UIEdgeInsets(top: topAndBottomDistance,
                                                   left: leftAndRightDistance,
                                                   bottom: topAndBottomDistance,
                                                   right: leftAndRightDistance)
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
        
        // init and size
        myCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        guard let collectionView = myCollectionView else { return }
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: CategoryCellSizeConstants.distanceToBorder,
                                                   left: CategoryCellSizeConstants.distanceToBorder,
                                                   bottom: CategoryCellSizeConstants.distanceToBorder,
                                                   right: CategoryCellSizeConstants.distanceToBorder)
        
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
