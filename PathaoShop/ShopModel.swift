//
//  ShopModel.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 22/12/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Shop: Codable {
    let shopName: String?
    let items, prouducts: [Prouduct]?

    enum CodingKeys: String, CodingKey {
        case shopName = "shop_name"
        case items
        case prouducts = "Prouducts"
    }
}

// MARK: - Prouduct
struct Prouduct: Codable {
    let name, prouductDescription: String?
    let price: Int?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case name
        case prouductDescription = "description"
        case price, image
    }
}

typealias ShopList = [Shop]

