//
//  PortraitViewController.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

class PortraitViewController: UIViewController {
    
    let portraitViewModel: PortraitViewModel
    required init(portraitViewModel: PortraitViewModel) {
        print("PortraitViewController => Created")
        self.portraitViewModel = portraitViewModel
        super.init(nibName: "PortraitViewController", bundle: .main)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    deinit {
        print("PortraitViewController => Destroyed")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var reusableViewModel: ReusableViewModel!
    var reusableViewController: ReusableViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reusableViewModel = ReusableViewModel(rootViewModel: portraitViewModel.rootViewModel)
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
        
        reusableViewController.labelTitle.text = "Portrait Only"
        reusableViewController.labelOrientationStyle.text = "Fixed Orientation"
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        [.portrait, .portraitUpsideDown]
    }
    
}

