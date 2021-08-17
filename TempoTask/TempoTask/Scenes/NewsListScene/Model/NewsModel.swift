//
//  NewsModel.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 18/08/2021.
//

import Foundation

// MARK: - Welcome
struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case articles = "articles"
        case totalResults
    }
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, content , publishedAt
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
