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
        setupTableView()
    }
    
    private func setupTableView() {
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
        shopListTableView.register(UINib(nibName: ShopHeaderView.className, bundle: nil), forHeaderFooterViewReuseIdentifier: ShopHeaderView.className)
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
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ShopHeaderView.className) as? ShopHeaderView
        headerView?.shopNameLabel.text = "Karim Shop"
        //headerView?.backgroundConfiguration?.backgroundColor = .gray
        return headerView!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShopListCell = tableView.dequeueReusableCell(withIdentifier: ShopListCell.className, for: indexPath) as! ShopListCell
        cell.backgroundColor = .green
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
}
