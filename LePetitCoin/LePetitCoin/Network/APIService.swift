//
//  APIService.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 04/10/2022.
//

import Foundation
import os

class APIService {
    let logger = Logger(subsystem: "com.cyrilconraud.LePetitCoin", category: "CategoriesService")
    let networkRequester = NetworkRequester()

    func handleError(_ error: Error) {
        logger.log("Error fetching Ads: \(error)")
    }
}
