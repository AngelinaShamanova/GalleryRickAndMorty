//
//  GalleryModel.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import Foundation

struct GalleryModel: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let name: String
    let image: String
    let created: String
}
