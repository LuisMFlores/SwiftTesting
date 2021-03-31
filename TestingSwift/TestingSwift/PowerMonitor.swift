//
//  PowerMonitor.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import UIKit

struct PowerMonitor {
    
    var device: DeviceMock
    
    func getStatus() -> String {
        if device.batteryState == .unknown {
            return "Error"
        } else if device.batteryState == .unplugged {
            return "Power Off"
        } else {
            return "Power On"
        }
    }
}
