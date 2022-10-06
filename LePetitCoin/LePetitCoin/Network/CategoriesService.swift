//
//  CategoriesService.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 04/10/2022.
//

import Foundation

class CategoriesService: APIService {

    func fetchCategories(completionHandler: @escaping ([AdCategory]?) -> Void) {

        logger.log("Fetching Categories...")

        networkRequester.performRequest(on: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json") { result in

            switch result {
            case let .success(data):
                let categories = try? JSONDecoder().decode([AdCategory].self, from: data)
                completionHandler(categories)
            case let .failure(error):
                self.logger.log("Unexpected error while fetching Categories: \(error).")
                completionHandler(nil)
            }
        }
    }
}
