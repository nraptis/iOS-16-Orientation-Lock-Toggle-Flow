//
//  RootViewModel.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

final class RootViewModel {
    let applicationController: ApplicationController
    var orientation: Orientation
    let window: UIWindow
    let windowScene: UIWindowScene
    init(applicationController: ApplicationController,
         orientation: Orientation,
         window: UIWindow,
         windowScene: UIWindowScene) {
        self.applicationController = applicationController
        self.orientation = orientation
        self.window = window
        self.windowScene = windowScene
    }
    
    var device: Device { applicationController.device }
    
    func pushToPortraitOnly(reversed: Bool) {
        let portraitViewModel = PortraitViewModel(rootViewModel: self)
        let portraitViewController = PortraitViewController(portraitViewModel: portraitViewModel)
        let fromOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        let toOrientation = Orientation.portrait
        print("Pushing Portrait Only, From: \(windowScene.interfaceOrientation)")
        print("Pushing Portrait Only, To: \(toOrientation)")
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
        let fromOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        let toOrientation = Orientation.landscape
        print("Pushing Portrait Only, From: \(windowScene.interfaceOrientation)")
        print("Pushing Portrait Only, To: \(toOrientation)")
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
        let fromOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        let toOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        print("Pushing BOTH, From: \(windowScene.interfaceOrientation)")
        print("Pushing BOTH, To: \(windowScene.interfaceOrientation) | \(toOrientation)")
        ApplicationController.rootViewController.push(viewController: landscapeAndPortraitViewController,
                                                      fromOrientation: fromOrientation,
                                                      toOrientation: toOrientation,
                                                      fixedOrientation: false,
                                                      animated: true,
                                                      reversed: reversed)
    }
}
