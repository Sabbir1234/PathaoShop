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
        return viewModel.shopItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ShopItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopItemCell.className, for: indexPath) as! ShopItemCell
        cell.configureCell(item: viewModel.shopItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 270)
    }
}
