//
//  PodcastsMockViewController.swift
//  iTunes Client App
//
//  Created by Murat ŞENOL on 5.10.2022.
//

import Foundation
import UIKit

class PodcastMockViewController: UIViewController {
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var podcastResponse: PodcastResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

class MusicMockViewController: UIViewController {
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var musicResponse: MusicResponse? {
        didSet {
            mainView.refresh()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}

class MovieMockViewController: UIViewController {
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var moviewResponse: MovieResponse? {
        didSet {
            mainView.refresh()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

class SoftwareMockViewController: UIViewController {
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var softwareResponse: SoftwareResponse? {
        didSet {
            mainView.refresh()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
}

class EBookMockViewController: UIViewController {
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var ebookResponse: EBookResponse? {
        didSet {
            mainView.refresh()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}
