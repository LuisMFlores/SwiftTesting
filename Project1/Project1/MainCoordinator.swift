//
//  MainCoordinator.swift
//  Project1
//
//  Created by luis flores on 4/3/21.
//

import UIKit

class MainCoordinator {
    
    var navigationController = UINavigationController()
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateInitialViewController() as? ViewController else {
            fatalError("Missing initial view controller in Main.storyboard")
        }
        viewController.pictureSelectionAction = { [weak self] in
            self?.showDetail(for: $0)
        }
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showDetail(for filename: String) {
        let detailVC = DetailViewController()
        detailVC.selectedImage = filename
        navigationController.pushViewController(detailVC, animated: true)
    }
}
