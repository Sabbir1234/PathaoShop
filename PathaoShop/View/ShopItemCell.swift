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
    @IBOutlet weak var countView: UIView!
    
    var addButtonActionBlock: (()->())?
    
    var removeButtonActionBlock: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemCountLabel.text = "0"
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
        buttonsView.layer.borderWidth = 1.0
        buttonsView.layer.borderColor = UIColor.blue.cgColor
        countView.layer.cornerRadius = 6.0
    }
    
    func configureCell(item: Product) {
        self.itemCountLabel.text = "\(item.itemCount ?? 0)"
        self.nameLabel.text = item.name
        self.detailsLabel.text = item.prouductDescription
        if let price = item.price {
            self.priceLabel.text = "\(price) $"
        }
        loadImage(url: URL(string: item.image ?? ""))
    }
    
    func loadImage(url: URL?) {
        DispatchQueue.global().async { [weak self] in
            if let url = url, let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.itemImageView.image = image
                    }
                }
            }
        }
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if let addButtonActionBlock = addButtonActionBlock {
            addButtonActionBlock()
        }
    }
    
    @IBAction func removeButtonAction(_ sender: Any) {
        if let removeButtonActionBlock = removeButtonActionBlock {
            removeButtonActionBlock()
        }
    }
}
