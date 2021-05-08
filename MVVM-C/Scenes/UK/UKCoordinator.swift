//
//  UKCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

class UKCoordinator: Coordinator {
    let rootNavigationController: UINavigationController!
    
    private(set) var storyboard = UIStoryboard(name: "UK", bundle: Bundle.main)
    
    lazy var londonViewModel: LondonViewModel = {
        let viewModel = LondonViewModel()
        return viewModel
    }()
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        let londonViewController: LondonViewController = storyboard.instantiateViewController(identifier: "LondonViewController")
        londonViewController.viewModel = londonViewModel
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(londonViewController, animated: true)
        } else {
            rootNavigationController.setViewControllers([londonViewController], animated: true)
        }
    }
    
    override func finish() {
        
    }
}
