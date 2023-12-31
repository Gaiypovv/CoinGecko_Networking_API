//
//  NewsModel.swift
//  CoinGecko_Networking_API
//
//  Created by Eldar Gaiypov on 20/12/23.
//

import Foundation

struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
}


struct Article: Codable, Hashable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}
