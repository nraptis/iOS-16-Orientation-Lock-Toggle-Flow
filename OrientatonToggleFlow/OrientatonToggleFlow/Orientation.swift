//
//  Orientation.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

enum Orientation {
    case landscape
    case portrait
    init(interfaceOrientation: UIInterfaceOrientation) {
        switch interfaceOrientation {
        case .portrait, .portraitUpsideDown:
            self = .portrait
        case .landscapeLeft, .landscapeRight:
            self = .landscape
        default:
            self = .portrait
        }
    }
    
    init(deviceOrientation: UIDeviceOrientation) {
        switch deviceOrientation {
        case .portrait, .portraitUpsideDown:
            self = .portrait
        case .landscapeLeft, .landscapeRight:
            self = .landscape
        default:
            self = .portrait
        }
    }
    
    var isLandscape: Bool {
        switch self {
        case .landscape:
            return true
        case .portrait:
            return false
        }
    }
}
