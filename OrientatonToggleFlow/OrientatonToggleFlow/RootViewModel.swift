//
//  RootViewModel.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

final class RootViewModel {
    
    let applicationController: ApplicationController
    var orientation: Orientation {
        didSet {
            print("Orientation Changed => \(orientation)")
        }
    }
    
    init(applicationController: ApplicationController, orientation: Orientation) {
        self.applicationController = applicationController
        self.orientation = orientation
    }
    
    var device: Device { applicationController.device }
    
    deinit {
        print("RootViewModel => Destroyed")
    }
    
    func pushToPortraitOnly(reversed: Bool) {
        let portraitViewModel = PortraitViewModel(rootViewModel: self)
        let portraitViewController = PortraitViewController(portraitViewModel: portraitViewModel)
        let fromOrientation = Orientation(interfaceOrientation: device.windowScene.interfaceOrientation)
        let toOrientation = Orientation.portrait
        ApplicationController.rootViewController.push(viewController: portraitViewController,
                                                      fromOrientation: fromOrientation,
                                                      toOrientation: toOrientation,
                                                      fixedOrientation: true,
                                                      animated: true,
                                                      reversed: reversed)
    }
    
    func pushToLandscapeOnly(reversed: Bool) {
        let landscapeViewModel = LandscapeViewModel(rootViewModel: self)
        let landscapeViewController = LandscapeViewController(landscapeViewModel: landscapeViewModel)
        let fromOrientation = Orientation(interfaceOrientation: device.windowScene.interfaceOrientation)
        let toOrientation = Orientation.landscape
        ApplicationController.rootViewController.push(viewController: landscapeViewController,
                                                      fromOrientation: fromOrientation,
                                                      toOrientation: toOrientation,
                                                      fixedOrientation: true,
                                                      animated: true,
                                                      reversed: reversed)
    }
    
    func pushToLandscapeAndPortrait(reversed: Bool) {
        let landscapeAndPortraitViewModel = LandscapeAndPortraitViewModel(rootViewModel: self)
        let landscapeAndPortraitViewController = LandscapeAndPortraitViewController(landscapeAndPortraitViewModel: landscapeAndPortraitViewModel)
        let fromOrientation = Orientation(interfaceOrientation: device.windowScene.interfaceOrientation)
        let toOrientation = Orientation(interfaceOrientation: device.windowScene.interfaceOrientation)
        ApplicationController.rootViewController.push(viewController: landscapeAndPortraitViewController,
                                                      fromOrientation: fromOrientation,
                                                      toOrientation: toOrientation,
                                                      fixedOrientation: false,
                                                      animated: true,
                                                      reversed: reversed)
    }
}
