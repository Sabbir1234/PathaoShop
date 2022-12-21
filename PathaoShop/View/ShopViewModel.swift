//
//  ShopViewModel.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 22/12/22.
//

import Foundation

class ShopViewModel {
    
    
    func loadDataFromJsonFile() {
        if let path = Bundle.main.path(forResource: AppConstant.pathao_shop, ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let shopList: ShopList = try! JSONDecoder().decode([Shop].self, from: jsonData)
                debugPrint("json data is \(shopList)")
            } catch let error {
                debugPrint("\(error)")
            }
        }
    }
}
    

