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
    
    lazy var aOneViewModel: AOneViewModel = {
        let viewModel = AOneViewModel()
       // viewModel.delegate = self
        return viewModel
    }()
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        instantiateFirstViewController(allowsReturnToPreviousCoordinator: allowsReturnToPreviousCoordinator)
    }
    
    override func finish() {}
    
    func returnRootViewController() -> AOneViewController {
        let aOneViewController: AOneViewController = storyboard.instantiateViewController(identifier: "AOneViewController")
        aOneViewController.viewModel = aOneViewModel
        return aOneViewController
    }
    
    private func instantiateFirstViewController(allowsReturnToPreviousCoordinator: Bool) {
        let aOneViewController: AOneViewController = storyboard.instantiateViewController(identifier: "AOneViewController")
        aOneViewController.viewModel = aOneViewModel
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(aOneViewController, animated: true)
        } else {
            rootNavigationController.setViewControllers([aOneViewController], animated: true)
        }
    }
}

extension ACoordinator {
    
    func presentA2ViewController(_ navigationController: UINavigationController) {
        let controller: ATwoViewController = storyboard.instantiateViewController(identifier: "ATwoViewController")
        navigationController.pushViewController(controller, animated: true)
    }
    
    func presentA3ViewController(_ navigationController: UINavigationController) {
        let controller: AThreeViewController = storyboard.instantiateViewController(identifier: "AThreeViewController")
        navigationController.pushViewController(controller, animated: true)
    }
    
    func presentB1ViewController(_ navigationController: UINavigationController) {
        let bStoryboard = UIStoryboard(name: "B", bundle: Bundle.main)
        let controller: BOneViewController = bStoryboard.instantiateViewController(identifier: "BOneViewController")
        navigationController.pushViewController(controller, animated: true)
    }
    
    func presentC1ViewController(_ navigationController: UINavigationController) {
        let cStoryboard = UIStoryboard(name: "C", bundle: Bundle.main)
        let controller: COneViewController = cStoryboard.instantiateViewController(identifier: "COneViewController")
        navigationController.pushViewController(controller, animated: true)
    }
}
