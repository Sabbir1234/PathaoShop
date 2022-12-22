//
//  ShopListCell.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 21/12/22.
//

import UIKit

class ShopListCell: UITableViewCell {
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    var viewModel: ItemListDelegate!
    var index: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = ShopViewModel()
        viewModel.loadShopItems(index: index)
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCollectionView() {
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        itemsCollectionView.register(UINib(nibName: ShopItemCell.className, bundle: nil), forCellWithReuseIdentifier: ShopItemCell.className)
    }

}

extension ShopListCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(viewModel.shopItems.count, 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ShopItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopItemCell.className, for: indexPath) as! ShopItemCell
        let item = viewModel.shopItems[indexPath.item]
        cell.configureCell(item: item)
        
        //Add button action block
        cell.addButtonActionBlock = {
            if let itemCount = item.itemCount {
                if itemCount < 5 {
                    item.itemCount = itemCount + 1
                    CartManager.shared.totalItemNumber += 1
                }
                
            } else {
                item.itemCount = 1
            }
            
            guard let itemNumber = item.itemCount else { return }
            cell.itemCountLabel.text = "\(itemNumber)"
            
            
        }
        
        //Remove button action block
        cell.removeButtonActionBlock = {
            if let itemCount = item.itemCount {
                if itemCount > 1 {
                    item.itemCount = itemCount - 1
                    CartManager.shared.totalItemNumber -= 1
                }
            } else {
                item.itemCount = 0
            }
            item.itemCount = (item.itemCount ?? 0) < 0 ? 0 : (item.itemCount ?? 0)
            guard let itemNumber = item.itemCount else { return }
            cell.itemCountLabel.text = "\(itemNumber)"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 270)
    }
}
