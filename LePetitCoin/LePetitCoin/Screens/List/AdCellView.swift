//
//  AdCell.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 02/10/2022.
//

import UIKit

class AdCellView: UITableViewCell {

    lazy var leftImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    var ad: Ad? = nil

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
        addSubview(leftImage)
        NSLayoutConstraint.activate([
            leftImage.topAnchor.constraint(equalTo: topAnchor),
            leftImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftImage.rightAnchor.constraint(equalTo: rightAnchor),
            leftImage.widthAnchor.constraint(equalTo: leftImage.heightAnchor)
        ])
    }

    func setupCell(viewModel: AdCellViewModel) {

//        var content = defaultContentConfiguration()
//        content.image = ad.image
//        ImageCache.publicCache.load(url: ad.url as NSURL, item: item) { (fetchedItem, image) in
//            if let img = image, img != fetchedItem.image {
//                var updatedSnapshot = self.dataSource.snapshot()
//                if let datasourceIndex = updatedSnapshot.indexOfItem(fetchedItem) {
//                    let item = self.imageObjects[datasourceIndex]
//                    item.image = img
//                    updatedSnapshot.reloadItems([item])
//                    self.dataSource.apply(updatedSnapshot, animatingDifferences: true)
//                }
//            }
//        }
//        cell.contentConfiguration = content

//        leftImage.image = UIImage(named: image)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
