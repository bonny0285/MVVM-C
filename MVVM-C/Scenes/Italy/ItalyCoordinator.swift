//
//  ItalyCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

private enum ItalyControllers: String {
    case rome = "RomeViewController"
    case milan = "MilanViewController"
    case naples = "NaplesViewController"
        
    func instantiate() -> BaseViewController {
        let storyboard = UIStoryboard(name: "Italy", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: self.rawValue)
    }
}

class ItalyCoordinator: Coordinator {
    let rootNavigationController: UINavigationController!
    
    private var romeViewModel: RomeViewModel {
        let viewModel = RomeViewModel()
        viewModel.delegate = self
        return viewModel
    }
    
    private var milanViewModel: MilanViewModel {
        let viewModel = MilanViewModel()
        viewModel.delegate = self
        return viewModel
    }
    
    private var naplesViewModel: NaplesViewModel {
        let viewModel = NaplesViewModel()
        viewModel.delegate = self
        return viewModel
    }
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        let romeViewController = ItalyControllers.rome.instantiate() as! RomeViewController
        romeViewController.viewModel = romeViewModel
        
        if allowsReturnToPreviousCoordinator {
            // Used for create a connection to previous coordinator
            rootNavigationController.pushViewController(romeViewController, animated: true)
        } else {
            // Used for create a blank starting point (empty stack of viewControllers)
            rootNavigationController.setViewControllers([romeViewController], animated: true)
        }
        
        
    }
    
    override func finish() {}
}

extension ItalyCoordinator: BaseViewModelDelegate {
    func popViewController() {
        rootNavigationController.popViewController(animated: true)
    }
}

extension ItalyCoordinator: RomeViewModelDelegate {
    
    func goToMilanFromRome() {
        let milanController = ItalyControllers.milan.instantiate() as! MilanViewController
        milanController.viewModel = milanViewModel
        rootNavigationController.pushViewController(milanController, animated: true)
    }
    
    func goToNaplesFromRome() {
        let naplesController = ItalyControllers.naples.instantiate() as! NaplesViewController
        naplesController.viewModel = naplesViewModel
        rootNavigationController.pushViewController(naplesController, animated: true)
    }
    
    func goToLondonFromRome() {
        let ukCoordinator = UKCoordinator(rootNavigationController: rootNavigationController)
        ukCoordinator.start(allowsReturnToPreviousCoordinator: true)
    }
}

extension ItalyCoordinator: MilanViewModelDelegate {
    func goToNaplesFromMilan() {
        let naplesController = ItalyControllers.naples.instantiate() as! NaplesViewController
        naplesController.viewModel = naplesViewModel
        rootNavigationController.pushViewController(naplesController, animated: true)
    }
    
    func goToUKFromMilan() {
        let ukCoordinator = UKCoordinator(rootNavigationController: rootNavigationController)
        ukCoordinator.start(allowsReturnToPreviousCoordinator: true)
    }
}

extension ItalyCoordinator: NaplesViewModelDelegate {
    func goToRomeFromNaples() {
        let romeController = ItalyControllers.rome.instantiate() as! RomeViewController
        romeController.viewModel = romeViewModel
        rootNavigationController.pushViewController(romeController, animated: true)
    }
    
    func goToUKFromNaples() {
        let ukCoordinator = UKCoordinator(rootNavigationController: rootNavigationController)
        ukCoordinator.start(allowsReturnToPreviousCoordinator: true)
    }
}


