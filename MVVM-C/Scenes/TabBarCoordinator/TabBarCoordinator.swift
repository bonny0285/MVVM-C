//
//  TabBarCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class MyCustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupControllers()
    }
    
    func setupControllers() {
        
        viewControllers = [
            UIStoryboard(name: "A", bundle: Bundle.main).instantiateViewController(identifier: "AOneViewController"),
            UIStoryboard(name: "B", bundle: Bundle.main).instantiateViewController(identifier: "BOneViewController"),
            UIStoryboard(name: "C", bundle: Bundle.main).instantiateViewController(identifier: "COneViewController")
        ]
        
        for (index, rootVC) in viewControllers!.enumerated() {

            var vc: UIViewController?

            switch index {
            case 1:
                vc = UIStoryboard(name: "A", bundle: Bundle.main).instantiateViewController(identifier: "AOneViewController")


            case 2:
                vc = UIStoryboard(name: "B", bundle: Bundle.main).instantiateViewController(identifier: "BOneViewController")

            case 3:
                vc = UIStoryboard(name: "C", bundle: Bundle.main).instantiateViewController(identifier: "COneViewController")

            default: break
            }

            if let nav = rootVC as? UINavigationController, let basevc = vc {
                nav.setViewControllers([basevc], animated: false)
            }
        }
    }
}

class TabBarCoordinator: Coordinator {
    
    let tabBarController = MyCustomTabBarController()
    
    let rootNavigationController: UINavigationController!

    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
        
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        let tab = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateViewController(identifier: "MyCustomTabBarController") as! UITabBarController
        rootNavigationController.isNavigationBarHidden = true
        rootNavigationController.setViewControllers([tab], animated: true)
        let itmes = [
            UITabBarItem(title: "A", image: nil, tag: 0),
            UITabBarItem(title: "B", image: nil, tag: 1),
            UITabBarItem(title: "C", image: nil, tag: 2)
        ]
        
        for i in 0 ..< itmes.count {
            tab.viewControllers?[i].tabBarItem = itmes[i]
        }
        print("TOTAL CONTROLLER: \(tab.viewControllers?.count)")
        //rootNavigationController.pushViewController(tab, animated: true)
    }
    
    override func finish() {
        print("AIRPORT COORDINATOR FINISHED")
    }
}
