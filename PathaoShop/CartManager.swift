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
    var totalItemNumber = 0
    private init() { }
    
    func loadItemsToCart(item: Product) {
        itemList.append(item)
    }
}
