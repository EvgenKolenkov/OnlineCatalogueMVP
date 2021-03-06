//
//  DetailedItemViewController.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import UIKit
import AlamofireImage

class DetailedItemViewController: UIViewController, HandledVC {

    // MARK: - @IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var productNumberLabel: UILabel!
    @IBOutlet private weak var pictureImageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var tableView: SelfSizedTableView!
    @IBOutlet private weak var lastVisitedLabel: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    private let presenter = DetailedItemPresenter(dataService: ApiService())
    private lazy var dataSource: [SearchedItemDisplayedModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var displayedModel: SearchedItemDisplayedModel?

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsOnLoad()
        setupDataOnLoad()
        setupPresenter()
    }

    // MARK: - Private methods
    private func setupViewsOnLoad() {
        self.title = Locals.detailsTitle
        
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .label
        
        productNumberLabel.font = UIFont.systemFont(ofSize: 15)
        productNumberLabel.textColor = .secondaryLabel
        
        priceLabel.font = UIFont.systemFont(ofSize: 17)
        priceLabel.textColor = .label
        
        descriptionTextView.font = UIFont.systemFont(ofSize: 13)
        descriptionTextView.textColor = .secondaryLabel

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.tableFooterView = UIView()
        
        lastVisitedLabel.font = UIFont.systemFont(ofSize: 15)
        lastVisitedLabel.textColor = .label
        lastVisitedLabel.text = Locals.lastVisited
    }

    private func setupDataOnLoad() {
        if let model = displayedModel {
            titleLabel.text = model.title
            productNumberLabel.text = model.productNumber
            if let urlString = model.thumbnailUrlString,
               let url = URL(string: urlString) {
                pictureImageView.af.setImage(withURL: url)
            }
            if let price = model.price,
               let currency = model.currency {
                priceLabel.text = String(price) + " " + currency
            } else {
                priceLabel.text = "-"
            }
        }
        retrieveItemsFromStorage()
        scrollView.scrollToTop()
    }
    
    private func setupPresenter() {
        presenter.connect(with: self)
        presenter.detailedItemCallback = { [weak self] description in
            self?.descriptionTextView.text = description
        }
        getItemDetails()
    }
    
    private func retrieveItemsFromStorage() {
        let userDefaults = UserDefaults.standard
        do {
            let lastVisited = try userDefaults.getObject(forKey: UserDefaultsKeys.lastVisited.rawValue, castTo: [SearchedItemDisplayedModel].self)
            dataSource = lastVisited
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func saveItemsToStorage(by indexPath: IndexPath) {
        let userDefaults = UserDefaults.standard
        do {
            let lastVisited = try userDefaults.getObject(forKey: UserDefaultsKeys.lastVisited.rawValue, castTo: [SearchedItemDisplayedModel].self)
            dataSource = lastVisited
        } catch {
            print(error.localizedDescription)
        }
        if !dataSource.contains(where: { $0.id == dataSource[indexPath.row].id }) {
            dataSource.insert(dataSource[indexPath.row], at: 0)
        } else {
            let updatedItem = dataSource.remove(at: indexPath.row)
            dataSource.insert(updatedItem, at: 0)
        }
        if dataSource.count > 5 {
            dataSource = dataSource.dropLast()
        }
        do {
            try userDefaults.setObject(dataSource, forKey: UserDefaultsKeys.lastVisited.rawValue)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func updateDetailsAndStorage(by indexPath: IndexPath) {
        displayedModel = dataSource[indexPath.row]
        saveItemsToStorage(by: indexPath)
        setupDataOnLoad()
        getItemDetails()
    }
    
    private func getItemDetails() {
        if let model = displayedModel,
           let id = model.id {
            presenter.getCatalogueItemDetails(id: id)
        }
    }
}

// MARK: - UITableViewDataSource
extension DetailedItemViewController: UITableViewDataSource {
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
extension DetailedItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        updateDetailsAndStorage(by: indexPath)
    }
}
