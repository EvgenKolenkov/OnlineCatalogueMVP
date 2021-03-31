//
//  SearchedItemsPresenter.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

private typealias SearchResponse = RequestResultModel<CatalogueSearchResponseModel>

class SearchedItemsPresenter: BasePresenter {
    
    private var dataService: DataService
    
    var searchedItemsCallback: (([SearchedItemDisplayedModel]) -> Void)?

    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func searchCatalogueItems(searchedText: String) {
        handleSpinner?(true)
        
        dataService.getSearchedData(searchedData: searchedText) { [weak self] (result: SearchResponse) in
            self?.handleSpinner?(false)

            if let error = result.error {
                self?.handleError?(error)
                return
            }
            
            guard let value = result.value?.results else { return }
            
            self?.searchedItemsCallback?(value.compactMap({
                return SearchedItemDisplayedModel(responseModel: $0)
            }))
        }
    }
}
