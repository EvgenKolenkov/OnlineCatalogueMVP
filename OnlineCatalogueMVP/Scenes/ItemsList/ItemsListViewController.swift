//
//  ItemsListViewController.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import UIKit

class ItemsListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

//    private let presenter = NewsPresenter()
    private var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsOnLoad()
    }


    // MARK: Private
    private func setupViewsOnLoad() {
        self.title = "List of products".localized
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.tableFooterView = UIView()
    }

}

extension ItemsListViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       dataSource.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.getCell(ofType: ItemTableViewCell.self)
       cell.configureWith(model: dataSource[indexPath.row])
       return cell
   }
}
 
extension ItemsListViewController: UITableViewDelegate {

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: false)
       
       
   }
}
