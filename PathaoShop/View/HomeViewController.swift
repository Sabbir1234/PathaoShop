//
//  HomeViewController.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 20/12/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var shopListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
//        shopListTableView.sectionHeaderHeight = UITableView.automaticDimension
//        shopListTableView.estimatedSectionHeaderHeight = 60
//        shopListTableView.rowHeight = UITableView.automaticDimension
//        shopListTableView.estimatedRowHeight = 150
        shopListTableView.register(UINib(nibName: "ShopHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ShopHeaderView")
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ShopHeaderView") as? ShopHeaderView
        headerView?.shopNameLabel.text = "Karim Shop"
        headerView?.backgroundColor = .cyan
        return headerView!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShopListCell = tableView.dequeueReusableCell(withIdentifier: "ShopListCell", for: indexPath) as! ShopListCell
        cell.backgroundColor = .green
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
}
