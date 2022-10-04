//
//  ListViewModel.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 02/10/2022.
//

import UIKit
import os

final class ListViewModel: NSObject {

    private let logger = Logger(subsystem: "com.cyrilconraud.LePetitCoin", category: "ListViewModel")
    let cellReuseIdentifier = "AdCell"

    var categoriesFetched: () -> Void = {}
    var adsFetched: () -> Void = {}

    var categories: [AdCategory]? = nil
    let categoriesService = CategoriesService()

    var ads: [Ad]? = nil
    let adsService = AdsService()
}

extension ListViewModel {
    func fetchCategories(completionHandler: () -> Void) {
        categoriesService.fetchCategories { [weak self] categories in
            guard let self else { return }
            self.categories = categories
        }
    }
}

extension ListViewModel {
    func categoriesFetched(_ remoteCategories: [AdCategory]?) {
        logger.log("\(remoteCategories?.count ?? 0) categories fetched !")

        categories = remoteCategories
        categoriesFetched()
    }

    func adsFetched(_ remoteAds: [Ad]?) {
        logger.log("\(remoteAds?.count ?? 0) categories fetched !")

        ads = remoteAds
        adsFetched()
    }
}

/* UIViewController Lifecycle */
extension ListViewModel {
    func viewDidLoad() {
        categoriesService.fetchCategories(completionHandler: { [weak self] remoteCategories in
            guard let self else { return }
            self.categoriesFetched(remoteCategories)
        })
    }

    func viewWillAppear() {
        adsService.fetchAds(completionHandler: { [weak self] remoteAds in
            guard let self else { return }
            self.adsFetched(remoteAds)
        })
    }

    func viewDidAppear() {}

    func viewWillDisappear() {}

    func viewDidDisappear() {}
}

extension ListViewModel: UITableViewDelegate {

}

extension ListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let ads else { return 0 }
        return ads.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let ads else { return UITableViewCell() }

        if let cell = tableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as? AdCellView,
           let ad = ads[safe: indexPath.row] {

            cell.setupCell(viewModel: AdCellViewModel(from: ad, of: categoryFrom(ad)))
            return cell
        }

        return UITableViewCell()
    }
}

extension ListViewModel {
    func categoryFrom(_ ad: Ad) -> AdCategory? {
        return categories?.first(where: { aCategory in
            return aCategory.id == ad.categoryId
        })
    }
}
