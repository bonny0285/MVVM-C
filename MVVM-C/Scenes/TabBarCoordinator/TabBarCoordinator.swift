//
//  TabBarCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class MyCustomTabBarController: UITabBarController, UITabBarControllerDelegate {
  
    //MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Controller: \(viewController)")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

protocol TabBarCoordinatorDelegate: AnyObject {
    
}

class TabBarCoordinator: Coordinator {
    
    let tabBarController: MyCustomTabBarController!
    
    var rootNavigationController: UINavigationController!
    
    var coordinatorA: ACoordinator!
    var aNavigation = UINavigationController()
    
    var coordinatorB: BCoordinator!
    var bNavigation = UINavigationController()
    
    var coordinatorC: CCoordinator!
    var cNavigation = UINavigationController()
    
    var viewControllerContainer: [UIViewController] = []
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
        rootNavigationController.isNavigationBarHidden = true
        
        tabBarController = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateViewController(identifier: "MyCustomTabBarController")

        coordinatorA = ACoordinator(rootNavigationController: aNavigation)
        coordinatorA.start(allowsReturnToPreviousCoordinator: false)
        aNavigation.tabBarItem = UITabBarItem(title: "A", image: nil, tag: 0)
        
        coordinatorB = BCoordinator(rootNavigationController: bNavigation)
        coordinatorB.start(allowsReturnToPreviousCoordinator: false)
        bNavigation.tabBarItem = UITabBarItem(title: "B", image: nil, tag: 1)
        
        coordinatorC = CCoordinator(rootNavigationController: cNavigation)
        coordinatorC.start(allowsReturnToPreviousCoordinator: false)
        cNavigation.tabBarItem = UITabBarItem(title: "C", image: nil, tag: 2)
        
        tabBarController.viewControllers = [aNavigation, bNavigation, cNavigation]
        tabBarController.navigationController?.isNavigationBarHidden = true
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        rootNavigationController.setViewControllers([tabBarController], animated: true)
    }
    
    override func finish() {}
}

