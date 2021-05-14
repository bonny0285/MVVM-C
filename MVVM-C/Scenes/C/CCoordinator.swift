//
//  CCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class CCoordinator: Coordinator {
    let rootNavigationController: UINavigationController!
    
    private(set) var storyboard = UIStoryboard(name: "C", bundle: Bundle.main)
    
//    lazy var airportViewModel: AirportViewModel = {
//        let viewModel = AirportViewModel()
//        viewModel.delegate = self
//        return viewModel
//    }()
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        instantiateFirstViewController(allowsReturnToPreviousCoordinator: allowsReturnToPreviousCoordinator)
    }
    
    override func finish() {}
    
    func returnRootViewController() -> UIViewController {
        let cOneViewController: COneViewController = storyboard.instantiateViewController(identifier: "COneViewController")
        //aOneViewController.viewModel = aOneViewModel
        return cOneViewController
    }
    
    private func instantiateFirstViewController(allowsReturnToPreviousCoordinator: Bool) {
        let cOneViewController: COneViewController = storyboard.instantiateViewController(identifier: "COneViewController")
        //cOneViewController.viewModel = aOneViewModel
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(cOneViewController, animated: true)
        } else {
            rootNavigationController.setViewControllers([cOneViewController], animated: true)
        }
    }

}
