//
//  CartManager.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 22/12/22.
//

import Foundation

class CartManager {
    static let shared = CartManager()
    var itemList = [Product]()
    var popFromStore: (()->())?
    var totalItemNumber = 0 {
        didSet {
            debugPrint("Total number \(totalItemNumber)")
            if totalItemNumber < 1 {
                popFromStore?()
            }
        }
    }
    var shops = [Shop]()
    private init() { }
    
    func loadItemsToCart(item: Product) {
        itemList.append(item)
    }
}
