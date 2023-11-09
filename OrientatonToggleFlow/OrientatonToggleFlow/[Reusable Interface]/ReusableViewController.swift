//
//  ReusableViewController.swift
//  OrientatonToggleFlow
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

class ReusableViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var containerPaddedContentView: UIView!
    @IBOutlet weak var titleLabelContainerView: UIView!
    @IBOutlet weak var orientationLabelContainerView: UIView!
    @IBOutlet weak var segmentPushMode: UISegmentedControl!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelOrientationStyle: UILabel!
    
    @IBOutlet weak var buttonPortraitOnly: UIButton!
    @IBOutlet weak var buttonLandscapeOnly: UIButton!
    @IBOutlet weak var buttonLandscapeAndPortrait: UIButton!
    
    lazy var leftWall: UIView = {
        let result = UIView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = UIColor.red.withAlphaComponent(0.25)
        return result
    }()
    
    lazy var rightWall: UIView = {
        let result = UIView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
        return result
    }()
    
    lazy var topWall: UIView = {
        let result = UIView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = UIColor.green.withAlphaComponent(0.25)
        return result
    }()
    
    lazy var bottomWall: UIView = {
        let result = UIView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = UIColor.cyan.withAlphaComponent(0.25)
        return result
    }()
    
    let reusableViewModel: ReusableViewModel
    required init(reusableViewModel: ReusableViewModel) {
        self.reusableViewModel = reusableViewModel
        super.init(nibName: "ReusableViewController", bundle: .main)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var rootViewModel: RootViewModel { reusableViewModel.rootViewModel }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.backgroundColor = UIColor(red: 0.9125,
                                                green: 0.9125,
                                                blue: 0.9125,
                                                alpha: 1.0)
        containerView.layer.cornerRadius = 12.0
        containerView.layer.borderColor = UIColor(red: 0.8125,
                                                  green: 0.8125,
                                                  blue: 0.8125,
                                                  alpha: 1.0).cgColor
        containerView.layer.borderWidth = 1.0
        
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        containerView.layer.shadowRadius = 2.0
        containerView.layer.shadowOffset = CGSize(width: -1.0,
                                                  height: 2.0)
        
        containerPaddedContentView.backgroundColor = UIColor.clear
        titleLabelContainerView.backgroundColor = UIColor.clear
        orientationLabelContainerView.backgroundColor = UIColor.clear
        
        
        if let view = view {
            view.addSubview(leftWall)
            leftWall.addConstraints([
                .init(item: leftWall, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 8.0)
            ])
            view.addConstraints([
                leftWall.leftAnchor.constraint(equalTo: view.leftAnchor),
                leftWall.topAnchor.constraint(equalTo: view.topAnchor),
                leftWall.bottomAnchor.constraint(equalTo: view.bottomAnchor)

            ])
            
            view.addSubview(rightWall)
            rightWall.addConstraints([
                .init(item: rightWall, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 8.0)
            ])
            view.addConstraints([
                rightWall.rightAnchor.constraint(equalTo: view.rightAnchor),
                rightWall.topAnchor.constraint(equalTo: view.topAnchor),
                rightWall.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                
            ])
            
            view.addSubview(topWall)
            topWall.addConstraints([
                .init(item: topWall, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 8.0)
            ])
            view.addConstraints([
                topWall.leftAnchor.constraint(equalTo: view.leftAnchor),
                topWall.rightAnchor.constraint(equalTo: view.rightAnchor),
                topWall.topAnchor.constraint(equalTo: view.topAnchor)
            ])
            
            view.addSubview(bottomWall)
            bottomWall.addConstraints([
                .init(item: bottomWall, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 8.0)
            ])
            view.addConstraints([
                bottomWall.leftAnchor.constraint(equalTo: view.leftAnchor),
                bottomWall.rightAnchor.constraint(equalTo: view.rightAnchor),
                bottomWall.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
        }
        
    }
    
    @IBAction func togglePushMode(_ sender: Any) {
        
    }
    
    @IBAction func clickPortraitOnly(_ sender: Any) {
        let reversed = segmentPushMode.selectedSegmentIndex == 1
        rootViewModel.pushToPortraitOnly(reversed: reversed)
    }
    
    @IBAction func clickLandscapeOnly(_ sender: Any) {
        let reversed = segmentPushMode.selectedSegmentIndex == 1
        rootViewModel.pushToLandscapeOnly(reversed: reversed)
    }
    
    @IBAction func clickLandscapeAndPortrait(_ sender: Any) {
        let reversed = segmentPushMode.selectedSegmentIndex == 1
        rootViewModel.pushToLandscapeAndPortrait(reversed: reversed)
    }
    
}
