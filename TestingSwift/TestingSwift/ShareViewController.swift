//
//  ShareViewController.swift
//  TestingSwift
//
//  Created by luis flores on 3/29/21.
//

import UIKit

class ShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        
        view = ShareView { [ weak self] in
            self?.shareContent(text: $0)
        }
    }

    func shareContent(text: String) {
        print("Sharing content")
    }
}
