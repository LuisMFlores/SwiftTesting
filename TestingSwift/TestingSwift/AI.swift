//
//  AI.swift
//  TestingSwift
//
//  Created by luis flores on 3/28/21.
//

import Foundation

struct AI {
    func startMove(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion()
        }
    }
}
