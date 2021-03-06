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
    @IBOutlet private weak var noDataLabel: UILabel!
    
    // MARK: - Properties
    private let presenter = SearchedItemsPresenter(dataService: ApiService())
    private lazy var dataSource: [SearchedItemDisplayedModel] = [] {
        didSet {
            tableView.scroll(to: .top, animated: true)
            tableView.reloadData()
        }
    }
    private lazy var lastVisitedDataSource: [SearchedItemDisplayedModel] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsOnLoad()
        setupPresenter()
    }

    // MARK: - Private methods
    private func setupViewsOnLoad() {
        self.title = Locals.searchTitle
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.tableFooterView = UIView()
        
        searchBar.delegate = self
        searchBar.placeholder = Locals.searchPlaceholder
        
        noDataLabel.font = UIFont.systemFont(ofSize: 15)
        noDataLabel.textColor = .secondaryLabel
        noDataLabel.text = Locals.noData
        noDataLabel.isHidden = true
        
        autoDismissKeyboard()
    }

    private func setupPresenter() {
        presenter.connect(with: self)
        presenter.searchedItemsCallback = { [weak self] dataSource in
            self?.dataSource = dataSource
            self?.noDataLabel.isHidden = !dataSource.isEmpty
        }
    }
    
    private func saveItemsToStorage(by indexPath: IndexPath) {
        let userDefaults = UserDefaults.standard
        do {
            let lastVisited = try userDefaults.getObject(forKey: UserDefaultsKeys.lastVisited.rawValue, castTo: [SearchedItemDisplayedModel].self)
            lastVisitedDataSource = lastVisited
        } catch {
            print(error.localizedDescription)
        }
        if !lastVisitedDataSource.contains(where: { $0.id == dataSource[indexPath.row].id }) {
            lastVisitedDataSource.insert(dataSource[indexPath.row], at: 0)
        }
        if lastVisitedDataSource.count > 5 {
            lastVisitedDataSource = lastVisitedDataSource.dropLast()
        }
        
        do {
            try userDefaults.setObject(lastVisitedDataSource, forKey: UserDefaultsKeys.lastVisited.rawValue)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - UITableViewDataSource
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
 
// MARK: - UITableViewDelegate
extension SearchedItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        saveItemsToStorage(by: indexPath)
        
        let detailedItemVC = DetailedItemViewController.instantiate(from: .main)
        detailedItemVC.displayedModel = dataSource[indexPath.row]
        navigationController?.pushViewController(detailedItemVC, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension SearchedItemsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.searchCatalogueItems(searchedText: searchBar.text!)
    }
}
