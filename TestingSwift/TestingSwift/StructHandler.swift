//
//  StructHandler.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import UIKit

typealias urlOpener = (URL, [UIApplication.OpenExternalURLOptionsKey : Any], ((Bool) -> Void)?) -> Void

struct URLHandler {
    
    let urlOpener: urlOpener
    func openURL(url :URL) {
        if url.absoluteString.hasPrefix("internal") {
            
        } else {
            urlOpener(url, [:], nil)
        }
    }
}
