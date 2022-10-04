//
//  AdCellViewModel.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 02/10/2022.
//

import UIKit

struct AdCellViewModel {
    var category: AdCategory? = nil
    let title: String
    let price: Double
    let imageUrl: String
    let isUrgent: Bool

    init(from ad: Ad, of matchedCategory: AdCategory?) {
        category = matchedCategory
        title = ad.title
        price = ad.price
        imageUrl = ad.thumbnailImageUrl
        isUrgent = ad.isUrgent
    }
}
