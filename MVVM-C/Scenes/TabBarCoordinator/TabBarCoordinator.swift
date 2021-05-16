//
//  TabBarCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class MyCustomTabBarController: UITabBarController {
  
    //MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
    }
}

protocol TabBarCoordinatorDelegate: AnyObject {
    
}

class TabBarCoordinator: Coordinator {
    
    let tabBarController: MyCustomTabBarController!
    
    let rootNavigationController: UINavigationController!
    
    var coordinatorA: ACoordinator!
    var coordinatorB: BCoordinator!
    var coordinatorC: CCoordinator!
    var viewControllerContainer: [UIViewController] = []
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
        
        tabBarController = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateViewController(identifier: "MyCustomTabBarController")
        
        
        let aNavigation = tabBarController.viewControllers?[0] as! UINavigationController
        coordinatorA = ACoordinator(rootNavigationController: aNavigation)
        coordinatorA.aOneViewModel.delegate = coordinatorA
        coordinatorA.start(allowsReturnToPreviousCoordinator: false)
        aNavigation.tabBarItem = UITabBarItem(title: "A", image: nil, tag: 0)
        
        let bNavigation = tabBarController.viewControllers?[1] as! UINavigationController
        coordinatorB = BCoordinator(rootNavigationController: bNavigation)
        coordinatorB.start(allowsReturnToPreviousCoordinator: false)
        bNavigation.tabBarItem = UITabBarItem(title: "B", image: nil, tag: 1)
        
        let cNavigation = tabBarController.viewControllers?[2] as! UINavigationController
        coordinatorC = CCoordinator(rootNavigationController: cNavigation)
        coordinatorC.start(allowsReturnToPreviousCoordinator: false)
        cNavigation.tabBarItem = UITabBarItem(title: "C", image: nil, tag: 2)
        
        tabBarController.viewControllers?.removeAll()
        tabBarController.viewControllers = [aNavigation, bNavigation, cNavigation]
//        rootNavigationController.isNavigationBarHidden = true
//        rootNavigationController.setViewControllers([tabBarController], animated: true)
 
        
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        rootNavigationController.setViewControllers([tabBarController], animated: true)

    }
    
    override func finish() {
        print("AIRPORT COORDINATOR FINISHED")
    }
}

extension TabBarCoordinator: AOneViewModelDelegate {
    func moveToA2ViewController() {
        coordinatorA.presentA2ViewController(tabBarController)
    }
    
    func moveToA3ViewController() {
        coordinatorA.presentA3ViewController(tabBarController.navigationController!)
    }
    
    func moveToB1ViewController() {
        coordinatorA.presentB1ViewController(tabBarController.navigationController!)
    }
    
    func moveToC1ViewController() {
        coordinatorA.presentC1ViewController(tabBarController.moreNavigationController)
    }
}
