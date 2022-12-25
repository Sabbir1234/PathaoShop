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
    var reloadItemsActionBlock: (([Product])->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = ShopViewModel()
        setupCollectionView()
        reloadItemsActionBlock = { [weak self] items in
            self?.viewModel.loadShopItems(items: items)
            self?.itemsCollectionView.reloadData()
        }
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
                CartManager.shared.totalItemNumber += 1
                CartManager.shared.loadItemsToCart(item: item)
            }
            item.addedToCart = true
            guard let itemNumber = item.itemCount, let price = item.price else { return }
            cell.itemCountLabel.text = "\(itemNumber)"
            cell.priceLabel.text = "Price: \(price * max(itemNumber,1)) $"
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
            guard let itemNumber = item.itemCount, let price = item.price else { return }
            cell.itemCountLabel.text = "\(itemNumber)"
            cell.priceLabel.text = "Price: \(price * max(itemNumber,1)) $"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 270)
    }
}
