//
//  ListViewController.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 01/10/2022.
//

import UIKit

class ListViewController: UIViewController {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true

        view.backgroundColor = .systemBackground
        title = "Annonces"

        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)

        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }

    @objc func moveToDetailScreen() {
        let detailScreen = DetailViewController()
        detailScreen.title = "Une annonce"
        navigationController?.pushViewController(detailScreen, animated: true)
    }
}

