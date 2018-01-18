//
//  ImageCollection.swift
//  zipImages
//
//  Created by Andrew Tsukuda on 1/17/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import Foundation


struct ImageCollection {
    let collectionName: String
    let zippedImagesString: String
    let zippedImagesUrl: URL
    let unzippedImagesUrl: URL? = nil
}

extension ImageCollection: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case collectionName = "collection_name"
        case zippedImagesUrl = "zipped_images_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName) ?? "NA"
        zippedImagesString = try container.decodeIfPresent(String.self, forKey: .zippedImagesUrl) ?? "zippedImageString"
        zippedImagesUrl = URL(string: zippedImagesString)!
    }
}
