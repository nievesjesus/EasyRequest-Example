//
//  RedditModel.swift
//  EasyRequest
//
//  Created by Jesus Nieves on 05/10/2019.
//  Copyright © 2019 Jesus Nieves. All rights reserved.
//

struct RedditModel: Codable {
    let kind: String
    let data: RedditPostModel
}

struct RedditPostModel: Codable {
    let id: String
    let title: String
    let author: String
    let numComments: Int
    let thumbnail: String
    let createdUtc: Double
    var readed: Bool? = false
}
