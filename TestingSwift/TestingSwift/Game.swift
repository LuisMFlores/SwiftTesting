//
//  Game.swift
//  TestingSwift
//
//  Created by luis flores on 3/27/21.
//

import Foundation

enum GameError: LocalizedError {
    case notPucharsed
    case notInstalled
    case parentalControlDisallowed
}

struct Game {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func play() throws {
        if name == "bioblitz" {
            throw GameError.notPucharsed
        } else if name == "blastazap" {
            throw GameError.notInstalled
        } else if name == "dead storm rising" {
            throw GameError.parentalControlDisallowed
        } else {
            print("Its ok to play this game")
        }
    }
}

extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}
