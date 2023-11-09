//
//  Device.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

class Device {
    
    let window: UIWindow
    let windowScene: UIWindowScene
    
    let widthPortrait: Float
    let heightPortrait: Float
    let widthLandscape: Float
    let heightLandscape: Float
    
    init(window: UIWindow, windowScene: UIWindowScene) {
        self.window = window
        self.windowScene = windowScene
        
        let _screenWidth = Float(Int(UIScreen.main.bounds.size.width + 0.5))
        let _screenHeight = Float(Int(UIScreen.main.bounds.size.height + 0.5))
        
        widthPortrait = _screenWidth < _screenHeight ? _screenWidth : _screenHeight
        heightPortrait = _screenWidth < _screenHeight ? _screenHeight : _screenWidth
        
        widthLandscape = heightPortrait
        heightLandscape = widthPortrait
        
        print("Device Portrait  [\(String(format: "%.1f", widthPortrait)) x \(String(format: "%.1f", heightPortrait))]")
        print("Device Landscape [\(String(format: "%.1f", widthLandscape)) x \(String(format: "%.1f", heightLandscape))]")
    }
}
