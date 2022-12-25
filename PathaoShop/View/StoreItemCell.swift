//
//  StoreItemCell.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 23/12/22.
//

import UIKit

class StoreItemCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var totalCountView: UIView!
    @IBOutlet weak var totalPriceView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var addButtonActionBlock: (()->())?
    
    var removeButtonActionBlock: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        contentView.layer.borderWidth = 5
        contentView.layer.borderColor = UIColor.blue.cgColor
        contentView.layer.cornerRadius = 15.0
        itemImageView.layer.borderWidth = 3
        itemImageView.layer.borderColor = UIColor.blue.cgColor
        itemImageView.layer.cornerRadius = 10.0
        nameView.layer.cornerRadius = 8.0
        nameView.layer.borderWidth = 1.0
        nameView.layer.borderColor = UIColor.blue.cgColor
        totalCountView.layer.cornerRadius = 8.0
        totalCountView.layer.borderWidth = 1.0
        totalCountView.layer.borderColor = UIColor.blue.cgColor
        totalPriceView.layer.cornerRadius = 8.0
        totalPriceView.layer.borderWidth = 1.0
        totalPriceView.layer.borderColor = UIColor.blue.cgColor
        buttonView.layer.borderWidth = 1.0
        buttonView.layer.borderColor = UIColor.blue.cgColor
    }
    
    func configureCell(item: Product) {
        self.totalCountLabel.text = "\(item.itemCount ?? 0)"
        self.nameLabel.text = item.name
        if let price = item.price {
            self.totalPriceLabel.text = "\(price * (item.itemCount ?? 0)) $"
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
