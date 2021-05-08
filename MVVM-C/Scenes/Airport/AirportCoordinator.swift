//
//  AirportCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

class AirportCoordinator: Coordinator {
    
    let rootNavigationController: UINavigationController!
    
    private(set) var storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    lazy var airportViewModel: AirportViewModel = {
        let viewModel = AirportViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        let airportViewController: AirportViewController = storyboard.instantiateViewController(identifier: "AirportViewController")
        airportViewController.viewModel = airportViewModel
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(airportViewController, animated: true)
        } else {
            rootNavigationController.setViewControllers([airportViewController], animated: true)
        }
    }
    
    override func finish() {
        print("AIRPORT COORDINATOR FINISHED")
    }
}

extension AirportCoordinator {
   

}

extension AirportCoordinator: AirportViewModelDelegate {
    
    func goToItaly() {
        let italyCoordinator = ItalyCoordinator(rootNavigationController: rootNavigationController)
        addChildCoordinator(italyCoordinator)
        finish()
        italyCoordinator.start(allowsReturnToPreviousCoordinator: false)
        
    }
    
    func goToUK() {
        let ukCoordinator = UKCoordinator(rootNavigationController: rootNavigationController)
        addChildCoordinator(ukCoordinator)
        finish()
        ukCoordinator.start(allowsReturnToPreviousCoordinator: false)
    }
}






