//
//  Software.swift
//  iTunes Client App
//
//  Created by Murat ŞENOL on 5.10.2022.
//
import Foundation

// MARK: - SoftwareResponse
struct SoftwareResponse: Decodable {
    let resultCount: Int?
    let results: [Software]?
}

// MARK: - Software
struct Software: Decodable {
    let screenshotUrls, ipadScreenshotUrls: [String]?
    let appletvScreenshotUrls: [String]?
    let artworkUrl60, artworkUrl512, artworkUrl100: URL?
    let artistViewURL: String?
    let isGameCenterEnabled: Bool?
    let features: [String]?
    let supportedDevices, advisories: [String]?
    let kind: String?
    let minimumOSVersion, trackCensoredName: String?
    let languageCodesISO2A: [String]?
    let fileSizeBytes: String?
    let formattedPrice: String?
    let contentAdvisoryRating: String?
    let averageUserRatingForCurrentVersion: Double?
    let userRatingCountForCurrentVersion: Int?
    let averageUserRating: Double?
    let trackViewURL: String?
    let trackContentRating: String?
    let releaseNotes, resultDescription, bundleID, primaryGenreName: String?
    let primaryGenreID, trackID: Int?
    let trackName: String?
    let releaseDate: String?
    let sellerName: String?
    let isVppDeviceBasedLicensingEnabled: Bool?
    let currentVersionReleaseDate: String?
    let genreIDS: [String]?
    let currency: String?
    let artistID: Int?
    let artistName: String?
    let genres: [String]?
    let price: Int?
    let version: String?
    let wrapperType: String?
    let userRatingCount: Int?
    let sellerURL: String?
    
    var artworkLarge: URL? {
        return URL(string: (artworkUrl100?.absoluteString.replacingOccurrences(of: "100x100", with: "600x600"))!)
    }
}

