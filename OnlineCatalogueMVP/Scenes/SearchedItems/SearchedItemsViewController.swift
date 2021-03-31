//
//  SearchedItemsViewController.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import UIKit

class SearchedItemsViewController: UIViewController, HandledVC {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    private let presenter = SearchedItemsPresenter(dataService: ApiService())
    private lazy var dataSource: [SearchedItemDisplayedModel] = [] {
        didSet {
            tableView.scroll(to: .top, animated: true)
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsOnLoad()
        setupPresenter()
    }

    // MARK: Private
    private func setupViewsOnLoad() {
        self.title = "List of products".localized
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.tableFooterView = UIView()
        
        searchBar.delegate = self
        
        autoDismissKeyboard()
    }

    private func setupPresenter() {
        presenter.connect(with: self)
        presenter.searchedItemsCallback = { [weak self] dataSource in
            self?.dataSource = dataSource
        }
    }
}

extension SearchedItemsViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       dataSource.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.getCell(ofType: ItemTableViewCell.self)
       cell.configureWith(model: dataSource[indexPath.row])
       return cell
   }
}
 
extension SearchedItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailedItemVC = DetailedItemViewController.instantiate(from: .main)
        detailedItemVC.displayedModel = dataSource[indexPath.row]
        navigationController?.pushViewController(detailedItemVC, animated: true)
    }
}

extension SearchedItemsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.searchCatalogueItems(searchedText: searchBar.text!)
    }
}
