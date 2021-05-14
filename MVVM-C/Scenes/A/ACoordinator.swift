//
//  ACoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class ACoordinator: Coordinator {
    
    let rootNavigationController: UINavigationController!
    
    private(set) var storyboard = UIStoryboard(name: "A", bundle: Bundle.main)
    
//    lazy var airportViewModel: AirportViewModel = {
//        let viewModel = AirportViewModel()
//        viewModel.delegate = self
//        return viewModel
//    }()
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        let aOneViewController: AOneViewController = storyboard.instantiateViewController(identifier: "AOneViewController")
        //aOneViewController.viewModel = aOneViewModel
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(aOneViewController, animated: true)
        } else {
            rootNavigationController.setViewControllers([aOneViewController], animated: true)
        }
    }
    
    override func finish() {
        print("AIRPORT COORDINATOR FINISHED")
    }
}
