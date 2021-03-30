//
//  ShareViewController.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import UIKit

class ShareViewController: UIViewController {
    override func loadView() {
        view = ShareView { [weak self] in
            self?.shareContent(text: $0)
        }
    }
    
    func shareContent(text: String) {
        print("Sharing text is \(text)")
    }
}
