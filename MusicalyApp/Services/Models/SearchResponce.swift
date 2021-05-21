//
//  SearchResponce.swift
//  MusicalyApp
//
//  Created by Mac on 19.05.2021.
//

import Foundation

struct SearchResponce: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
}