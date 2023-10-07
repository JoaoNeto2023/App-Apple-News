//
//  NewsModel.swift
//  AppAppleNews
//
//  Created by João Neto  on 03/10/23.
//

import Foundation

struct NewsModel: Codable {
    
    var source: SourceModel
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: Date
    var content: String?
}
