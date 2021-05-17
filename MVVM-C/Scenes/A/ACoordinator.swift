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
    
//    lazy var aOneViewModel: AOneViewModel = {
//        let viewModel = AOneViewModel()
//        viewModel.delegate = self
//        return viewModel
//    }()
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        let aOneViewController: AOneViewController = storyboard.instantiateViewController(identifier: "AOneViewController")
        aOneViewController.viewModel.delegate = self
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(aOneViewController, animated: true)
            
        } else {
            rootNavigationController.setViewControllers([aOneViewController], animated: true)
        }
    }
    
    override func finish() {}
}

extension ACoordinator: AOneViewModelDelegate {
    func moveToA2ViewController() {
        let controller: ATwoViewController = storyboard.instantiateViewController(identifier: "ATwoViewController")
        rootNavigationController.pushViewController(controller, animated: true)
    }
    
    func moveToA3ViewController() {
        let controller: AThreeViewController = storyboard.instantiateViewController(identifier: "AThreeViewController")
        rootNavigationController.pushViewController(controller, animated: true)
    }
    
    func moveToB1ViewController() {
        let bStoryboard = UIStoryboard(name: "B", bundle: Bundle.main)
        let controller: BOneViewController = bStoryboard.instantiateViewController(identifier: "BOneViewController")
        rootNavigationController.tabBarController?.tabBar.isHidden = true 
        rootNavigationController.pushViewController(controller, animated: true)
    }
    
    func moveToC1ViewController() {
        let cStoryboard = UIStoryboard(name: "C", bundle: Bundle.main)
        let controller: COneViewController = cStoryboard.instantiateViewController(identifier: "COneViewController")
        rootNavigationController.pushViewController(controller, animated: true)
    }
}

