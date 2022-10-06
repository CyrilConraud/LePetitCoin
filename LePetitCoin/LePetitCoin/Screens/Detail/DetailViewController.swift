//
//  DetailViewController.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 01/10/2022.
//

import UIKit

class DetailViewController: UIViewController {

    private struct UI {
        static let titleLabelFont: UIFont = .systemFont(ofSize: 17, weight: .semibold)
        static let proLabelFont: UIFont = .systemFont(ofSize: 16, weight: .semibold)
        static let siretLabelFont: UIFont = .systemFont(ofSize: 12)
        static let urgentLabelFont: UIFont = .systemFont(ofSize: 20, weight: .bold)
        static let priceLabelFont: UIFont = .systemFont(ofSize: 26, weight: .semibold)
        static let descriptionLabelFont: UIFont = .systemFont(ofSize: 12, weight: .semibold)

        static let proLabelHeight: CGFloat = 20
        static let siretLabelHeight: CGFloat = 20
    }

    private let viewModel: DetailViewModel

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageView: LazyImageView = {
        let imageView = LazyImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UI.titleLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let proLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UI.proLabelFont
        label.text = "PRO"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let siretLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UI.siretLabelFont
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

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.0, alpha: 0.9)
        label.font = UI.priceLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UI.descriptionLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Lifecycle
extension DetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}

extension DetailViewController {

    func setupUI() {
        view.backgroundColor = .systemBackground
        setupScrollView()
        setupImageView()
        setupTitleLabel()
        if viewModel.isProSeller() {
            setupProLabel()
            setupSiretLabel()
        }
        setupUrgentLabel()
        setupPriceLabel()
        setupDescriptionLabel()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    func setupImageView() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5)
        ])

        if let imageUrl = viewModel.imageUrl {
            imageView.loadImage(fromURL: imageUrl)
        }
    }

    func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.mediumMargin),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.mediumMargin),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.mediumMargin)
        ])

        titleLabel.text = viewModel.title
    }

    func setupProLabel() {
        contentView.addSubview(proLabel)
        NSLayoutConstraint.activate([
            proLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.mediumMargin),
            proLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.mediumMargin),
            proLabel.heightAnchor.constraint(equalToConstant: UI.proLabelHeight)
        ])
    }

    func setupSiretLabel() {
        contentView.addSubview(siretLabel)
        NSLayoutConstraint.activate([
            siretLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.mediumMargin),
            siretLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.mediumMargin),
            siretLabel.heightAnchor.constraint(equalToConstant: UI.siretLabelHeight)
        ])

        guard let siret = viewModel.siret else { return }
        siretLabel.text = "SIRET : \(siret)"
    }

    func setupUrgentLabel() {
        contentView.addSubview(urgentLabel)
        let aboveView = (viewModel.isProSeller()) ? proLabel : titleLabel

        NSLayoutConstraint.activate([
            urgentLabel.topAnchor.constraint(equalTo: aboveView.bottomAnchor, constant: Constants.mediumMargin),
            urgentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.mediumMargin)
        ])

        urgentLabel.isHidden = !viewModel.isUrgent
    }

    func setupPriceLabel() {
        contentView.addSubview(priceLabel)
        let aboveView = (viewModel.isProSeller()) ? siretLabel : titleLabel

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: aboveView.bottomAnchor, constant: Constants.mediumMargin),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.mediumMargin)
        ])

        priceLabel.text = String(format: "%.0f€", viewModel.price)
    }

    func setupDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: Constants.mediumMargin),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.mediumMargin),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.mediumMargin),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.mediumMargin)
        ])

        descriptionLabel.text = viewModel.description
    }
}
