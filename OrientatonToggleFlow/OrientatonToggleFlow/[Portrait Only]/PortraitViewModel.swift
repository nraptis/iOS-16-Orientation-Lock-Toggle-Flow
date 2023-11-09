//
//  PortraitViewModel.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import Foundation

final class PortraitViewModel {
    
    let rootViewModel: RootViewModel
    init(rootViewModel: RootViewModel) {
        print("PortraitViewModel => Created")
        self.rootViewModel = rootViewModel
    }
    
    deinit {
        print("PortraitViewModel => Destroyed")
    }
    
}
