//
//  ApplicationController.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import Foundation

class ApplicationController {
    
    static var rootViewModel: RootViewModel!
    static var rootViewController: RootViewController!
    
    let device: Device
    init(device: Device) {
        self.device = device
    }
}
