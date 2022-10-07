//
//  EBook.swift
//  iTunes Client App
//
//  Created by Murat ŞENOL on 5.10.2022.
//
import Foundation

// MARK: - EBookResponse
struct EBookResponse: Decodable {
    let resultCount: Int?
    let results: [EBook]?
}

// MARK: - EBook
struct EBook: Decodable {
    let artistID: Int?
    let artistName: String?
    let genres: [String]?
    let price: Double?
    let resultDescription: String?
    let genreIDS: [String]?
    let releaseDate: String?
    let trackID: Int?
    let trackName: String?
    let artistIDS: [Int]?
    let currency: String?
    let artworkUrl60: URL?
    let artistViewURL: String?
    let artworkUrl100: URL?
    let trackCensoredName: String?
    let fileSizeBytes: Int?
    let formattedPrice: String?
    let trackViewURL: String?
    let kind: String?
    let averageUserRating: Double?
    let userRatingCount: Int?
    
    var artworkLarge: URL? {
        return URL(string: (artworkUrl100?.absoluteString.replacingOccurrences(of: "100x100", with: "600x600"))!)
    }
}
