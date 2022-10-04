//
//  Ad.swift
//  LePetitCoin
//
//  Created by Cyril Conraud on 01/10/2022.
//

import Foundation

struct Ad: Identifiable, Codable {
    let id: Int
    let categoryId: Int
    let title: String
    let description: String
    let price: Double
    let imagesUrl: [String: String]
    let creationDate: String
    let isUrgent: Bool
    let siret: String?

    var thumbnailImageUrl: String {
        imagesUrl["thumb"]!
    }

    var smallImageUrl: String {
        imagesUrl["small"]!
    }

    private enum CodingKeys : String, CodingKey {
        case id
        case categoryId = "category_id"
        case title
        case description
        case price
        case imagesUrl = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
        case siret
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        price = try container.decode(Double.self, forKey: .price)
        imagesUrl = try container.decode([String: String].self, forKey: .imagesUrl)
        creationDate = try container.decode(String.self, forKey: .creationDate)
        isUrgent = try container.decode(Bool.self, forKey: .isUrgent)
        siret = try? container.decode(String.self, forKey: .siret)
    }
}
