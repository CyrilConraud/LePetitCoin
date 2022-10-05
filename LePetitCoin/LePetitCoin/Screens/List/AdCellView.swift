//
//  AdCell.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 02/10/2022.
//

import UIKit

class AdCellView: UITableViewCell {

    private let verySmallMargin = 4.0
    private let smallMargin = 8.0
    private let mediumMargin = 12.0


    static let identifer = "AdCell"

    var viewModel: AdCellViewModel? = nil

    private let adImageView: LazyImageView = {
        let imageView = LazyImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let urgentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "URGENT"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initImageView()
        initTitleLabel()
        initPriceLabel()
        initCategoryLabel()
        initUrgentLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        priceLabel.layer.cornerRadius = priceLabel.frame.size.height / 2
    }
}

extension AdCellView {
    func setupCell(viewModel: AdCellViewModel) {
        self.viewModel = viewModel

        if let imageUrl = viewModel.imageUrl {
            adImageView.loadImage(fromURL: imageUrl)
        }

        titleLabel.text = viewModel.title
        priceLabel.text = String(format: " %.2f€  ", viewModel.price)
        categoryLabel.text = viewModel.categoryName()
        urgentLabel.isHidden = !viewModel.isUrgent
    }
}

extension AdCellView {

    func initImageView() {
        addSubview(adImageView)
        NSLayoutConstraint.activate([
            adImageView.topAnchor.constraint(equalTo: topAnchor),
            adImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            adImageView.leftAnchor.constraint(equalTo: leftAnchor),
            adImageView.widthAnchor.constraint(equalTo: adImageView.heightAnchor)
        ])
    }

    func initTitleLabel() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: adImageView.rightAnchor, constant: mediumMargin),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -mediumMargin),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }

    func initPriceLabel() {
        addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: smallMargin),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -smallMargin),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -mediumMargin)
        ])
    }

    func initCategoryLabel() {
        addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -smallMargin),
            categoryLabel.leftAnchor.constraint(equalTo: adImageView.rightAnchor, constant: mediumMargin),
            categoryLabel.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    func initUrgentLabel() {
        addSubview(urgentLabel)
        NSLayoutConstraint.activate([
            urgentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: smallMargin),
            urgentLabel.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: -smallMargin),
            urgentLabel.leftAnchor.constraint(equalTo: adImageView.rightAnchor, constant: mediumMargin),
        ])
    }
}
