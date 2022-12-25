//
//  CategoryViewController.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 24/12/22.
//

import UIKit


class CategoryViewController: UIViewController {
    @IBOutlet weak var categoryItemsCollectionView: UICollectionView!
    private var flowLayout = ColumnFlowLayout()
    var shopItems = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        addNavBarButton()
        
    }
    
    private func setupCollectionView() {
        categoryItemsCollectionView.delegate = self
        categoryItemsCollectionView.dataSource = self
         //Set up the collection view.
        categoryItemsCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        categoryItemsCollectionView.alwaysBounceVertical = true
        categoryItemsCollectionView.indicatorStyle = .white
    }
    
    private func addNavBarButton() {
        let button = UIBarButtonItem(title: "Store", style: .done, target: self, action: #selector(storeButtonAction))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func storeButtonAction() {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoreViewController.className)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryItemCell.className, for: indexPath) as! CategoryItemCell
        cell.configureCell(item: shopItems[indexPath.item])
        let item = shopItems[indexPath.item]
        //Add button action block
        cell.addButtonActionBlock = {
            if let itemCount = item.itemCount {
                if itemCount < 5 {
                    item.itemCount = itemCount + 1
                    CartManager.shared.totalItemNumber += 1
                }
            } else {
                item.itemCount = 1
                CartManager.shared.loadItemsToCart(item: item)
            }
            item.addedToCart = true
            guard let itemNumber = item.itemCount else { return }
            cell.itemCountLabel.text = "\(itemNumber)"
        }
        
        //Remove button action block
        cell.removeButtonActionBlock = {
            if let itemCount = item.itemCount {
                if itemCount > 0 {
                    item.itemCount = itemCount - 1
                    CartManager.shared.totalItemNumber -= 1
                }
            } else {
                item.itemCount = 0
            }
            item.itemCount = (item.itemCount ?? 0) < 0 ? 0 : (item.itemCount ?? 0)
            item.addedToCart = (item.itemCount ?? 0) == 0 ? false : true
            guard let itemNumber = item.itemCount else { return }
            cell.itemCountLabel.text = "\(itemNumber)"
        }
        return cell
    }
}
