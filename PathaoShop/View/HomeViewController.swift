//
//  HomeViewController.swift
//  PathaoShop
//
//  Created by Sabbir Hossain on 20/12/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var shopListTableView: UITableView!
    var viewModel: HomePageDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarButton()
        setupTableView()
        viewModel = ShopViewModel()
        viewModel?.loadDataFromJsonFile(completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shopListTableView.reloadData()
    }
    
    private func setupTableView() {
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
        shopListTableView.register(UINib(nibName: ShopHeaderView.className, bundle: nil), forHeaderFooterViewReuseIdentifier: ShopHeaderView.className)
    }
    
    private func addNavBarButton() {
        let button = UIBarButtonItem(title: "Store", style: .done, target: self, action: #selector(storeButtonAction))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func storeButtonAction() {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoreViewController.className)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.shops.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ShopHeaderView.className) as? ShopHeaderView
        headerView?.shopNameLabel.text = viewModel?.shops[section].shopName
        //headerView?.backgroundConfiguration?.backgroundColor = .gray
        return headerView!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShopListCell = tableView.dequeueReusableCell(withIdentifier: ShopListCell.className, for: indexPath) as! ShopListCell
        cell.index = indexPath.row
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
