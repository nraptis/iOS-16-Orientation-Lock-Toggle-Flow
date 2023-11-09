//
//  LandscapeViewController.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

class LandscapeViewController: UIViewController {
    
    let landscapeViewModel: LandscapeViewModel
    required init(landscapeViewModel: LandscapeViewModel) {
        self.landscapeViewModel = landscapeViewModel
        super.init(nibName: "LandscapeViewController", bundle: .main)
        view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var reusableViewModel: ReusableViewModel!
    var reusableViewController: ReusableViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        reusableViewModel = ReusableViewModel(rootViewModel: landscapeViewModel.rootViewModel)
        reusableViewController = ReusableViewController(reusableViewModel: reusableViewModel)
        if let reusableView = reusableViewController.view, let view = self.view {
            view.addSubview(reusableView)
            reusableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                reusableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                reusableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                reusableView.topAnchor.constraint(equalTo: view.topAnchor),
                reusableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            view.layoutIfNeeded()
        }
        
        reusableViewController.labelTitle.text = "Landscape Only"
        reusableViewController.labelOrientationStyle.text = "Fixed Orientation"
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        [.landscapeLeft, .landscapeRight]
    }
    
}

