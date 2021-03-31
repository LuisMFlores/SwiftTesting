//
//  DeviceMock.swift
//  TestingSwift
//
//  Created by luis flores on 3/31/21.
//

import UIKit

class DeviceMock: UIDevice {
    
    var testBatteryState: BatteryState
    
    init(state: BatteryState) {
        self.testBatteryState = state
        super.init()
    }
    
    override var batteryState: UIDevice.BatteryState {
        return testBatteryState
    }
}
