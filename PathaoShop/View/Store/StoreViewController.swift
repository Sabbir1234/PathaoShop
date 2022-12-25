//
//  StoreViewController.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 23/12/22.
//

import UIKit

class StoreViewController: UIViewController {
    @IBOutlet weak var storeItemsTableView: UITableView!
    var items = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        items = CartManager.shared.itemList.filter({ item in
            item.addedToCart == true
        })
        if items.isEmpty {
            popVC()
        }
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CartManager.shared.popFromStore = {
            self.popVC()
        }
    }
    
    /// setup table view
    private func setupTableView() {
        storeItemsTableView.separatorStyle = .none
        storeItemsTableView.allowsSelection = false
        storeItemsTableView.delegate = self
        storeItemsTableView.dataSource = self
        storeItemsTableView.register(UINib(nibName: StoreItemCell.className, bundle: nil), forCellReuseIdentifier: StoreItemCell.className)
    }
    
    private func popVC() {
        self.navigationController?.popViewController(animated: true)
    }

}

//MARK: UITableview Delegate & Datasource
extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StoreItemCell = tableView.dequeueReusableCell(withIdentifier: StoreItemCell.className, for: indexPath) as! StoreItemCell
        let item = items[indexPath.item]
        cell.configureCell(item: item)
        //Add button action block
        cell.addButtonActionBlock = {
            if let itemCount = item.itemCount {
                if itemCount < 5 {
                    item.itemCount = itemCount + 1
                    CartManager.shared.totalItemNumber += 1
                }
            } else {
                item.itemCount = 1
                CartManager.shared.totalItemNumber += 1
                CartManager.shared.loadItemsToCart(item: item)
            }
            item.addedToCart = true
            guard let itemNumber = item.itemCount, let price = item.price else { return }
            cell.totalCountLabel.text = "Total count: \(item.itemCount ?? 0)"
            cell.totalPriceLabel.text = "Total price: \(price * itemNumber) $"
        }
        
        //Remove button action block
        cell.removeButtonActionBlock = {
            if let itemCount = item.itemCount {
                if itemCount > 0 {
                    item.itemCount = itemCount - 1
                    CartManager.shared.totalItemNumber -= 1
                }
            } else {
                item.itemCount = 0
            }
            item.itemCount = (item.itemCount ?? 0) <= 0 ? 0 : (item.itemCount ?? 0)
            item.addedToCart = (item.itemCount ?? 0) == 0 ? false : true
            if item.addedToCart == false {
//                self.items = CartManager.shared.itemList.filter({ item in
//                    item.addedToCart == true
//                })
                self.items.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            guard let itemNumber = item.itemCount, let price = item.price else { return }
            cell.totalCountLabel.text = "Total count: \(item.itemCount ?? 0)"
            cell.totalPriceLabel.text = "Total price: \(price * itemNumber) $"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
}
