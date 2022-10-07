//
//  MainViewController.swift
//  iTunes Client App
//
//  Created by Murat ŞENOL on 5.10.2022.
//

import UIKit

class MainViewController: UITabBarController {

    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        let viewController = MainMockViewController()
        viewController.mediaType = Media.podcast
        viewController.title = Media.podcast.name
        viewController.view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        
        let viewController2 = MainMockViewController()
        viewController2.mediaType = Media.music
        viewController2.title = Media.music.name
        viewController2.view.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9490196078, blue: 0.8117647059, alpha: 1)
        
        let viewController3 = MainMockViewController()
        viewController3.mediaType = Media.movie
        viewController3.title = Media.movie.name
        viewController3.view.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.9215686275, blue: 0.7725490196, alpha: 1)
        
        let viewController4 = MainMockViewController()
        viewController4.mediaType = Media.software
        viewController4.title = Media.software.name
        viewController4.view.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.7607843137, blue: 0.5960784314, alpha: 1)
        
        let viewController5 = MainMockViewController()
        viewController5.mediaType = Media.ebook
        viewController5.title = Media.ebook.name
        viewController5.view.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.8059648273, blue: 0.7414217921, alpha: 1)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigationController2 = UINavigationController(rootViewController: viewController2)
        let navigationController3 = UINavigationController(rootViewController: viewController3)
        let navigationController4 = UINavigationController(rootViewController: viewController4)
        let navigationController5 = UINavigationController(rootViewController: viewController5)

        self.viewControllers = [navigationController, navigationController2, navigationController3, navigationController4, navigationController5]
        
        guard let items = self.tabBar.items else {
            return
        }
        items[0].image = UIImage(systemName: "radio.fill")
        items[1].image = UIImage(systemName: "music.note")
        items[2].image = UIImage(systemName: "film.fill")
        items[3].image = UIImage(systemName: "app.badge.fill")
        items[4].image = UIImage(systemName: "book.fill")
         

    }

}

extension MainViewController: UITabBarControllerDelegate {
    
}
