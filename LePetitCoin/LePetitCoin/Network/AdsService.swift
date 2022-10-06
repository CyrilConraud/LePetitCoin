//
//  AdsService.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 02/10/2022.
//

import Foundation
import os

class AdsService: APIService {
    func fetchAds(completionHandler: @escaping ([Ad]?) -> Void) {

        logger.log("Fetching Ads...")

        networkRequester.performRequest(on: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") { result in

            switch result {
            case let .success(data):
                let ads = try? JSONDecoder().decode([Ad].self, from: data)
                completionHandler(ads)
            case let .failure(error):
                self.logger.log("Unexpected error while fetching Ads: \(error).")
                completionHandler(nil)
            }
        }
    }
}
