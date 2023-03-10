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
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30))
    }
    
    /// setup UI
    func setupUI() {
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor(named: "boarder")?.cgColor
        contentView.layer.cornerRadius = 15.0
        contentView.clipsToBounds = true
        itemImageView.layer.borderWidth = 1.0
        itemImageView.layer.borderColor = UIColor(named: "viewBoarder")?.cgColor
        itemImageView.layer.cornerRadius = 10.0
        nameView.layer.cornerRadius = 8.0
        nameView.layer.borderWidth = 1.0
        nameView.layer.borderColor = UIColor(named: "viewBoarder")?.cgColor
        totalCountView.layer.cornerRadius = 8.0
        totalCountView.layer.borderWidth = 1.0
        totalCountView.layer.borderColor = UIColor(named: "viewBoarder")?.cgColor
        totalPriceView.layer.cornerRadius = 8.0
        totalPriceView.layer.borderWidth = 1.0
        totalPriceView.layer.borderColor = UIColor(named: "viewBoarder")?.cgColor
        buttonView.layer.borderWidth = 1.0
        buttonView.layer.borderColor = UIColor(named: "viewBoarder")?.cgColor
    }
    
    /// configure cell
    /// - Parameter item: Product
    func configureCell(item: Product) {
        self.totalCountLabel.text = "Total count: \(item.itemCount ?? 0)"
        self.nameLabel.text = item.name
        if let price = item.price {
            self.totalPriceLabel.text = "Total price: \(price * (item.itemCount ?? 0)) $"
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
