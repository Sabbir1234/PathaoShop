//
//  ShopViewModel.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 22/12/22.
//

import Foundation

protocol HomePageDelegate {
    func loadDataFromJsonFile(completion: ((_ success: Bool) -> Void)?)
    var shops: [Shop] { get }
}

protocol ItemListDelegate {
    var shopItems: [Product] { get }
    func loadShopItems(items: [Product])
}

class ShopViewModel: HomePageDelegate, ItemListDelegate {
    
    var shops = [Shop]()
    var shopItems = [Product]()
    

    func loadDataFromJsonFile(completion: ((_ success: Bool) -> Void)? = nil) {
        if let path = Bundle.main.path(forResource: AppConstant.pathao_shop, ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.shops = try! JSONDecoder().decode([Shop].self, from: jsonData)
                CartManager.shared.shops = shops
                debugPrint("json data is \(shops)")
                completion?(true)
            } catch let error {
                debugPrint("\(error)")
            }
        }
    }
    
    func loadShopItems(items: [Product]) {
        self.shopItems = items
    }
    
}
    

