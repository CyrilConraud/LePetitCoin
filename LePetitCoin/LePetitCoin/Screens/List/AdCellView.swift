//
//  AdCell.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 02/10/2022.
//

import UIKit

class AdCellView: UITableViewCell {

    static let identifer = "AdCell"

    private struct UI {
        static let adImageViewCornerRadius: CGFloat = 12
        static let adImageViewBorderWidth: CGFloat = 4
        static let titleLabelFont: UIFont = .systemFont(ofSize: 17, weight: .semibold)
        static let urgentLabelFont: UIFont = .systemFont(ofSize: 16, weight: .bold)
        static let proLabelFont: UIFont = .systemFont(ofSize: 16, weight: .semibold)
        static let categoryLabelFont: UIFont = .systemFont(ofSize: 12)
        static let priceLabelFont: UIFont = .systemFont(ofSize: 20, weight: .semibold)

        static let titleLblHeight: CGFloat = 48
        static let priceLblHeight: CGFloat = 20
        static let categoryLblHeight: CGFloat = 16
    }

    var viewModel: AdCellViewModel!

    private let adImageView: LazyImageView = {
        let imageView = LazyImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = UI.adImageViewCornerRadius
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = UI.adImageViewBorderWidth
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UI.titleLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let urgentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .left
        label.font = UI.urgentLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "URGENT"
        return label
    }()

    private let proLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UI.proLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PRO"
        return label
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UI.categoryLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.0, alpha: 0.9)
        label.font = UI.priceLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImageView()
        setupTitleLabel()
        setupUrgentLabel()
        setupProLabel()
        setupCategoryLabel()
        setupPriceLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension AdCellView {
    func setupCell(viewModel: AdCellViewModel) {
        self.viewModel = viewModel

        if let imageUrl = viewModel.imageUrl {
            adImageView.loadImage(fromURL: imageUrl)
        }

        titleLabel.text = viewModel.title
        priceLabel.text = String(format: "%.0f€", viewModel.price)
        categoryLabel.text = viewModel.category?.name
        urgentLabel.isHidden = !viewModel.isUrgent
        proLabel.isHidden = !viewModel.isProSeller
    }
}

extension AdCellView {

    func setupImageView() {
        addSubview(adImageView)
        NSLayoutConstraint.activate([
            adImageView.topAnchor.constraint(equalTo: topAnchor),
            adImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            adImageView.leftAnchor.constraint(equalTo: leftAnchor),
            adImageView.widthAnchor.constraint(equalTo: adImageView.heightAnchor)
        ])
    }

    func setupTitleLabel() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: UI.titleLblHeight),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: adImageView.rightAnchor, constant: Constants.mediumMargin),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.mediumMargin)
        ])
    }

    func setupUrgentLabel() {
        addSubview(urgentLabel)
        NSLayoutConstraint.activate([
            urgentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.smallMargin),
            urgentLabel.leftAnchor.constraint(equalTo: adImageView.rightAnchor, constant: Constants.mediumMargin),
        ])
    }

    func setupProLabel() {
        addSubview(proLabel)
        NSLayoutConstraint.activate([
            proLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.smallMargin),
            proLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.mediumMargin)
        ])
    }

    func setupCategoryLabel() {
        addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.smallMargin),
            categoryLabel.leftAnchor.constraint(equalTo: adImageView.rightAnchor, constant: Constants.mediumMargin),
            categoryLabel.heightAnchor.constraint(equalToConstant: UI.categoryLblHeight)
        ])
    }

    func setupPriceLabel() {
        addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: UI.priceLblHeight),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.smallMargin),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.mediumMargin)
        ])
    }
}
