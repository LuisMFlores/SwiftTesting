//
//  DetailViewController.swift
//  Project1
//
//  Created by luis flores on 4/3/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    var imageView = UIImageView()
    var selectedImage: String?

    // MARK: Lifecycle
    
    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }

}
