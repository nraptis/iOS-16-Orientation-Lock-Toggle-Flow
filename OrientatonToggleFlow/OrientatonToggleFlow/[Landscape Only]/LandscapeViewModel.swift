//
//  LandscapeViewModel.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import Foundation

final class LandscapeViewModel {
    
    let rootViewModel: RootViewModel
    init(rootViewModel: RootViewModel) {
        print("LandscapeViewModel => Created")
        self.rootViewModel = rootViewModel
    }
    
    deinit {
        print("LandscapeViewModel => Destroyed")
    }
    
}
