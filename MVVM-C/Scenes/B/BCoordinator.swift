//
//  BCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class BCoordinator: Coordinator {
    let rootNavigationController: UINavigationController!
    
    private(set) var storyboard = UIStoryboard(name: "B", bundle: Bundle.main)
    
//    lazy var airportViewModel: AirportViewModel = {
//        let viewModel = AirportViewModel()
//        viewModel.delegate = self
//        return viewModel
//    }()
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
        super.init()
     
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        instantiateFirstViewController(allowsReturnToPreviousCoordinator: allowsReturnToPreviousCoordinator)
    }
    
    override func finish() {}
    
    func returnRootViewController() -> UIViewController {
        let bOneViewController: BOneViewController = storyboard.instantiateViewController(identifier: "BOneViewController")
        //aOneViewController.viewModel = aOneViewModel
        return bOneViewController
    }
    
    private func instantiateFirstViewController(allowsReturnToPreviousCoordinator: Bool) {
        let bOneViewController: BOneViewController = storyboard.instantiateViewController(identifier: "BOneViewController")
        //bOneViewController.viewModel = aOneViewModel
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(bOneViewController, animated: true)
        } else {
            rootNavigationController.setViewControllers([bOneViewController], animated: true)
        }
    }

}
