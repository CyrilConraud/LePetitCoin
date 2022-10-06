//
//  DetailViewModel.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 02/10/2022.
//

import Foundation

class DetailViewModel {
    var category: AdCategory? = nil
    let title: String
    let description: String
    let price: Double
    let imageUrl: URL?
    let isUrgent: Bool
    let siret: String?

    init(from ad: Ad, of matchedCategory: AdCategory?) {
        title = ad.title
        description = ad.description
        price = ad.price
        category = matchedCategory
        imageUrl = URL(string: ad.smallImageUrl)
        isUrgent = ad.isUrgent
        siret = ad.siret
    }
}

/* UIViewController Lifecycle */
extension DetailViewModel {
    func viewDidLoad() {}

    func viewWillAppear() {}

    func viewDidAppear() {}

    func viewWillDisappear() {}

    func viewDidDisappear() {}
}

extension DetailViewModel {
    func isProSeller() -> Bool {
        return siret != nil && siret != ""
    }
}
