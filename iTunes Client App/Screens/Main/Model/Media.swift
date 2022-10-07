//
//  Types.swift
//  iTunes Client App
//
//  Created by Murat ŞENOL on 7.10.2022.
//

import Foundation

enum Media {
    case podcast
    case music
    case movie
    case software
    case ebook
    
    var name: String {
        switch self{
        case .podcast: return "Podcast"
        case .music: return "Music"
        case .movie: return "Movie"
        case .software: return "Software"
        case .ebook: return "EBook"
        }
    }
    
    /*
    var type: Any.Type {
        switch self{
        case .podcast: return PodcastResponse.self
        case .music: return MusicResponse.self
        case .movie: return MovieResponse.self
        case .software: return SoftwareResponse.self
        case .ebook: return EBookResponse.self
        }
    }
     */
    
}
