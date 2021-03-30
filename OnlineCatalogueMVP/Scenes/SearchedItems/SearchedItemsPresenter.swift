//
//  SearchedItemsPresenter.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

class SearchedItemsPresenter: BasePresenter {
    
    private var dataService: DataService
    
    var dataSourceCallback: (([SearchedItemDisplayedModel]) -> Void)?
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func searchCatalogueItems(urlString: String) {
        handleSpinner?(true)
        
        dataService.getSearchedData(urlString: urlString, { [weak self] result in
            self?.handleSpinner?(false)

            if let error = result.error {
                self?.handleError?(error)
                return
            }
            
            guard let searchedItems = result.value?.results else { return }
            
            self?.dataSourceCallback?(searchedItems.compactMap({
                return SearchedItemDisplayedModel(responseModel: $0)
            }))
        })
    }
}
