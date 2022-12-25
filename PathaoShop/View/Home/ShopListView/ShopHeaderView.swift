//
//  ShopHeaderView.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 21/12/22.
//

import UIKit

protocol ShopHeaderViewDelegate {
    func navigateToCategoryList(index: Int)
}

class ShopHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    var delegate: ShopHeaderViewDelegate?
    var index = 0
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func seeAllButtonTapped(_ sender: Any) {
        delegate?.navigateToCategoryList(index: index)
    }
}
