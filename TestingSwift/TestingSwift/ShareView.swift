//
//  ShareView.swift
//  TestingSwift
//
//  Created by luis flores on 3/29/21.
//

import UIKit

class ShareView: UIView {
    
    var shareAction: (String) -> Void
    var textField: UITextField!
    
    init(shareAction: @escaping (String) -> Void) {
        self.shareAction = shareAction
        super.init(frame: .zero)
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        addSubview(textfield)
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 150, width: 300, height: 44)
        button.addTarget(self, action: #selector(sharedTapped), for: .touchUpInside)
        addSubview(textfield)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sharedTapped() {
        guard let text = textField.text else { return }
        shareAction(text)
        
    }
}
