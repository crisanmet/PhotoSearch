//
//  PhotoModel.swift
//  PhotoSearch
//
//  Created by Cristian Sancricca on 08/07/2022.
//

import Foundation

struct PhotoModel: Decodable {
    let hits: [Photo]
}

struct Photo: Decodable, Hashable {
    let id: Int
    let webformatURL: String
}
