//
//  ShopItemCell.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 21/12/22.
//

import UIKit

class ShopItemCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var DetailsView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var buttonsView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    func setupUI() {
        itemImageView.layer.borderWidth = 10
        itemImageView.layer.borderColor = UIColor.gray.cgColor
    }

}
