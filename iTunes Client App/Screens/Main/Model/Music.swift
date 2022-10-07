//
//  Music.swift
//  iTunes Client App
//
//  Created by Murat ŞENOL on 5.10.2022.
//
import Foundation

// MARK: - MusicResponse
struct MusicResponse: Decodable {
    let resultCount: Int?
    let results: [Music]?
}

// MARK: - Music
struct Music: Decodable {
    let wrapperType: String?
    let kind: String?
    let artistID, collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: URL?
    let collectionPrice, trackPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let isStreamable: Bool?
    let collectionArtistName, contentAdvisoryRating: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    
    var artworkLarge: URL? {
        return URL(string: (artworkUrl100?.absoluteString.replacingOccurrences(of: "100x100", with: "600x600"))!)
    }
}
