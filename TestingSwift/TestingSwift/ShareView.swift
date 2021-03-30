//
//  ShareView.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import UIKit

class ShareView: UIView {
    var shareAction: (String) -> Void
    var textfield: UITextField!
    
    init(shareAction: @escaping (String) -> Void) {
        self.shareAction = shareAction
        super.init(frame: .zero)
        let textfield = UITextField()
        addSubview(textfield)
        let button = UIButton(type: .system)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sharedTapped() {
        guard let text = textfield.text else { return }
        shareAction(text)
    }
    
}
