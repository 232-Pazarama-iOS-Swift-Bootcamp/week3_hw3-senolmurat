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

// MARK: - Result
struct Music: Decodable {
    let wrapperType: String?
    let kind: String?
    let artistID, collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let releaseDate: Date?
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
}
