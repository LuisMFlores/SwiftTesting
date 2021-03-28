//
//  User.swift
//  TestingSwift
//
//  Created by luis flores on 3/28/21.
//

import Foundation

enum UserLevel: Int {
    static let LEVEL_KEY = "LEVEL_KEY"
    case bronze, silver, gold
}

struct User {
    static let upgradeNotification = Notification.Name("UserUpgraded")
    
    func upgrade() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            let center = NotificationCenter.default
            center.post(name: User.upgradeNotification, object: nil)
        }
    }
    
    func upgrade(to level: UserLevel) {
        upgrade(using: NotificationCenter.default, to: .gold)
    }
    
    func upgrade(using center: NotificationCenter = NotificationCenter.default, to level: UserLevel) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: User.upgradeNotification, object: nil, userInfo: [UserLevel.LEVEL_KEY : level])
        }
    }
}
