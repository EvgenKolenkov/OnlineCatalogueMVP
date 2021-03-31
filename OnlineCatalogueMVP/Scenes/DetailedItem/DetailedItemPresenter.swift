//
//  DetailedItemPresenter.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import Foundation

private typealias DetailsResponse = RequestResultModel<[CatalogueItemDescription]>

class DetailedItemPresenter: BasePresenter {
    
    private var dataService: DataService
    
    var detailedItemCallback: ((String?) -> Void)?

    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func getCatalogueItemDetails(id: String) {
        handleSpinner?(true)
        
        dataService.getDetailedData(id: id) { [weak self] (result: DetailsResponse) in
            self?.handleSpinner?(false)

            if let error = result.error {
                self?.handleError?(error)
                return
            }
            
            guard let value = result.value else { return }
            
            self?.detailedItemCallback?(value.first?.plain_text)
        }
    }
}
