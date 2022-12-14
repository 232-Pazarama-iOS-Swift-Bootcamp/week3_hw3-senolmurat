//
//  Movie.swift
//  iTunes Client App
//
//  Created by Murat ŞENOL on 5.10.2022.
//
import Foundation

// MARK: - MovieResponse
struct MovieResponse: Decodable {
    let resultCount: Int?
    let results: [Movie]?
}

// MARK: - Movie
struct Movie: Decodable {
    let wrapperType: String?
    let kind: String?
    let collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: URL?
    let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double?
    let trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: String?
    let trackCount, trackNumber, trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let contentAdvisoryRating: String?
    let longDescription: String?
    let hasITunesExtras: Bool?
    let discCount, discNumber: Int?
    let shortDescription: String?
    let artistID: Int?
    let artistViewURL: String?
    
    var artworkLarge: URL? {
        return URL(string: (artworkUrl100?.absoluteString.replacingOccurrences(of: "100x100", with: "600x600"))!)
    }
}
