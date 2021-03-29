//
//  PowerMonitor.swift
//  TestingSwift
//
//  Created by luis flores on 3/29/21.
//

import UIKit

struct PowerMonitor {
    
    var device: UIDevice
    
    init(device: UIDevice = UIDevice.current) {
        self.device = device
    }
    
    func getStatus() -> String {
        switch device.batteryState {
        case .unknown:
            return "Error"
        case .unplugged:
            return "Power is down"
        default:
            return "Power is up"
        }
    }
}

class DeviceMock: UIDevice {
    
    var testBatteryState: BatteryState
    
    init(testBatteryState: BatteryState) {
        self.testBatteryState = testBatteryState
        super.init()
    }
    
    override var batteryState: UIDevice.BatteryState {
        return testBatteryState
    }
}
