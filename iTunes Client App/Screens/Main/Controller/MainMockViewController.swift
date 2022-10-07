//
//  MainMockViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

final class MainMockViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    
    private var podcastResponse: PodcastResponse? {
        didSet {
            mainView.refresh()
        }
    }
    private var musicResponse: MusicResponse? {
        didSet {
            mainView.refresh()
        }
    }
    private var movieResponse: MovieResponse? {
        didSet {
            mainView.refresh()
        }
    }
    private var softwareResponse: SoftwareResponse? {
        didSet {
            mainView.refresh()
        }
    }
    private var ebookResponse: EBookResponse? {
        didSet {
            mainView.refresh()
        }
    }
    var mediaType: Media?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = view.backgroundColor
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search something..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        switch mediaType {
        case .podcast:
            fetchMedia(PodcastRequest(searchText: mediaType?.name ?? "a"))
        case .music:
            fetchMedia(MusicRequest(searchText: mediaType?.name ?? "a"))
        case .movie:
            fetchMedia(MovieRequest(searchText: mediaType?.name ?? "a"))
        case .software:
            fetchMedia(SoftwareRequest(searchText: mediaType?.name ?? "a"))
        case .ebook:
            fetchMedia(EBookRequest(searchText: mediaType?.name ?? "a"))
        default:
            let alert = UIAlertController(title: "Hata", message: "Medya Yüklenemedi !", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alert.addAction(ok)
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
        }
    }
    
    // MARK: - Methods
    private func fetchMedia<Request: DataRequest>(_ request: Request) {
        networkService.request(request, compilation: { result in
            switch result {
            case .success(let response):
                switch self.mediaType {
                case .podcast:
                    self.podcastResponse = response as? PodcastResponse
                case .music:
                    self.musicResponse = response as? MusicResponse
                case .movie:
                    self.movieResponse = response as? MovieResponse
                case .software:
                    self.softwareResponse = response as? SoftwareResponse
                case .ebook:
                    self.ebookResponse = response as? EBookResponse
                default:
                    let alert = UIAlertController(title: "Hata", message: "Medya Yüklenemedi !", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                    alert.addAction(ok)
                    DispatchQueue.main.async {
                        self.present(alert, animated: true)
                    }
                }
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        })
    }
}

// MARK: - UICollectionViewDelegate
extension MainMockViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        switch mediaType {
        case .podcast:
            detailViewController.podcast = podcastResponse?.results?[indexPath.row]
        case .music:
            detailViewController.music = musicResponse?.results?[indexPath.row]
        case .movie:
            detailViewController.movie = movieResponse?.results?[indexPath.row]
        case .software:
            detailViewController.software = softwareResponse?.results?[indexPath.row]
        case .ebook:
            detailViewController.ebook = ebookResponse?.results?[indexPath.row]
        default:
            let alert = UIAlertController(title: "Hata", message: "Medya Yüklenemedi !", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alert.addAction(ok)
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
            return
        }
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MainMockViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch mediaType {
        case .podcast:
            return podcastResponse?.results?.count ?? 0
        case .music:
            return musicResponse?.results?.count ?? 0
        case .movie:
            return movieResponse?.results?.count ?? 0
        case .software:
            return softwareResponse?.results?.count ?? 0
        case .ebook:
            return ebookResponse?.results?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! iTunesItemCollectionViewCell
        switch mediaType {
        case .podcast:
            let podcast = podcastResponse?.results?[indexPath.row]
            cell.title = podcast?.trackName
            cell.imageView.downloadImage(from: podcast?.artworkLarge)
        case .music:
            let music = musicResponse?.results?[indexPath.row]
            cell.title = music?.trackName
            cell.imageView.downloadImage(from: music?.artworkLarge)
        case .movie:
            let movie = movieResponse?.results?[indexPath.row]
            cell.title = movie?.trackName
            cell.imageView.downloadImage(from: movie?.artworkLarge)
        case .software:
            let software = softwareResponse?.results?[indexPath.row]
            cell.title = software?.trackName
            cell.imageView.downloadImage(from: software?.artworkLarge)
        case .ebook:
            let ebook = ebookResponse?.results?[indexPath.row]
            cell.title = ebook?.trackName
            cell.imageView.downloadImage(from: ebook?.artworkLarge)
        default:
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension MainMockViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            switch mediaType {
            case .podcast:
                fetchMedia(PodcastRequest(searchText: text))
            case .music:
                fetchMedia(MusicRequest(searchText: text))
            case .movie:
                fetchMedia(MovieRequest(searchText: text))
            case .software:
                fetchMedia(SoftwareRequest(searchText: text))
            case .ebook:
                fetchMedia(EBookRequest(searchText: text))
            default:
                let alert = UIAlertController(title: "Hata", message: "Medya Yüklenemedi !", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                alert.addAction(ok)
                DispatchQueue.main.async {
                    self.present(alert, animated: true)
                }
            }
        }
    }
}

// MARK: - UITabBarControllerDelagate
extension MainMockViewController: UITabBarControllerDelegate {
    
}
