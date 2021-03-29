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

protocol UserProtocol {
    var funds: Decimal { get set }
    var age: Int { get set }
    var apps: [AppProtocol] { get set }
    
    mutating func buy(app: AppProtocol) -> Bool
}

struct User: UserProtocol {
    static let upgradeNotification = Notification.Name("UserUpgraded")
    var funds: Decimal = 0.0
    var age: Int = 18
    var apps: [AppProtocol] = []
    
    mutating func buy(app: AppProtocol) -> Bool {
        guard app.canBePurchased(by: self) == true else { return false }
        apps.append(app)
        funds -= app.price
        return true
    }
    
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
