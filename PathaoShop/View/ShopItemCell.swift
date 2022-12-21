//
//  ShopItemCell.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 21/12/22.
//

import UIKit

class ShopItemCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
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
        contentView.layer.borderWidth = 5
        contentView.layer.borderColor = UIColor.tintColor.cgColor
        contentView.layer.cornerRadius = 15.0
        itemImageView.layer.borderWidth = 3
        itemImageView.layer.borderColor = UIColor.red.cgColor
        itemImageView.layer.cornerRadius = 10.0
        nameView.layer.cornerRadius = 8.0
        nameView.layer.borderWidth = 1.0
        nameView.layer.borderColor = UIColor.blue.cgColor
        DetailsView.layer.cornerRadius = 8.0
        DetailsView.layer.borderWidth = 1.0
        DetailsView.layer.borderColor = UIColor.blue.cgColor
        priceView.layer.cornerRadius = 8.0
        priceView.layer.borderWidth = 1.0
        priceView.layer.borderColor = UIColor.blue.cgColor
        //buttonsView.layer.cornerRadius = 8.0
        buttonsView.layer.borderWidth = 1.0
        buttonsView.layer.borderColor = UIColor.blue.cgColor
        
    }

}
