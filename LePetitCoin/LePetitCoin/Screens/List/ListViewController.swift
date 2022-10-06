//
//  ListViewController.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 01/10/2022.
//

import UIKit

class ListViewController: UIViewController {
    private var viewModel = ListViewModel()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AdCellView.self, forCellReuseIdentifier: AdCellView.identifer)
        return tableView
    }()
}

// MARK: - Lifecycle
extension ListViewController {
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

// MARK: - Setup
extension ListViewController {
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Annonces"
        view.backgroundColor = .systemBackground

        setupViewModelHandlers()
        setupTableView()
    }

    func setupViewModelHandlers() {
        viewModel.categoriesFetched = { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.adsFetched = { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.adSelected = { [weak self] selectedAd, category in
            guard let self else { return }
            DispatchQueue.main.async {
                self.moveToDetailScreen(with: selectedAd, of: category)
            }
        }
    }

    func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        tableView.delegate = viewModel
        tableView.dataSource = viewModel
    }
}

// MARK: - Navigation
extension ListViewController {
    func moveToDetailScreen(with ad: Ad, of category: AdCategory?) {
        let viewModel = DetailViewModel(from: ad, of: category)
        let detailScreen = DetailViewController(viewModel: viewModel)
        detailScreen.title = viewModel.category?.name
        navigationController?.pushViewController(detailScreen, animated: true)
    }
}
