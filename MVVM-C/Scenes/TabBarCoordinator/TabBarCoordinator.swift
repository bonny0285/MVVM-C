//
//  TabBarCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class MyCustomTabBarController: UITabBarController {
  
    //MARK: - Properties

    var coordinatorA: ACoordinator!
    var coordinatorB: BCoordinator!
    var coordinatorC: CCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itmes = [
            UITabBarItem(title: "A", image: nil, tag: 0),
            UITabBarItem(title: "B", image: nil, tag: 1),
            UITabBarItem(title: "C", image: nil, tag: 2)
        ]
        #warning("Gestire l'aggiunta dei view controller")
        coordinatorA = ACoordinator(rootNavigationController: viewControllers![0] as! UINavigationController)
        viewControllers?.append(coordinatorA.returnRootViewController())
        coordinatorB = BCoordinator(rootNavigationController: viewControllers![1] as! UINavigationController, tabBarController: self)
        viewControllers?.append(coordinatorB.returnRootViewController())
        coordinatorC = CCoordinator(rootNavigationController: viewControllers![2] as! UINavigationController)
        
        let controller = [
            coordinatorA.returnRootViewController(),
            coordinatorB.returnRootViewController(),
            coordinatorC.returnRootViewController()
        ]
        
        viewControllers = controller
        
        for i in 0 ..< itmes.count {
            viewControllers?[i].tabBarItem = itmes[i]
        }
        
        print(tabBarItem.tag)
        
//        let aCoordinator = ACoordinator(rootNavigationController: self.navigationController!)
//        aCoordinator.start(allowsReturnToPreviousCoordinator: false)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("ITEM: \(item.tag)")
        switch item.tag {
        case 0:
            coordinatorA.start(allowsReturnToPreviousCoordinator: false)
            coordinatorA.returnRootViewController().viewModel.delegate = self
        case 1:
            coordinatorB.start(allowsReturnToPreviousCoordinator: false)
        case 2:
            coordinatorC.start(allowsReturnToPreviousCoordinator: false)
            
        default:
            print("TAG NOT PRESENT")
        }
    }
}

extension MyCustomTabBarController: AOneViewModelDelegate {
   func moveToA2ViewController() {
       coordinatorA.presentA2ViewController(self.navigationController!)
   }
   
   func moveToA3ViewController() {
       coordinatorA.presentA3ViewController(self.navigationController!)
   }
   
   func moveToB1ViewController() {
       coordinatorA.presentB1ViewController(self.navigationController!)
   }
   
   func moveToC1ViewController() {
       coordinatorA.presentC1ViewController(self.navigationController!)
   }
}

class TabBarCoordinator: Coordinator {
    
    let tabBarController: MyCustomTabBarController!
    
    let rootNavigationController: UINavigationController!

    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
        
        tabBarController = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateViewController(identifier: "MyCustomTabBarController")
        rootNavigationController.isNavigationBarHidden = true
        rootNavigationController.setViewControllers([tabBarController], animated: true)
//        let itmes = [
//            UITabBarItem(title: "A", image: nil, tag: 0),
//            UITabBarItem(title: "B", image: nil, tag: 1),
//            UITabBarItem(title: "C", image: nil, tag: 2)
//        ]
//
//        for i in 0 ..< itmes.count {
//            tabBarController.viewControllers?[i].tabBarItem = itmes[i]
//        }
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
      
//        let aCoordinator = ACoordinator(rootNavigationController: rootNavigationController)
//        aCoordinator.start(allowsReturnToPreviousCoordinator: false)
    }
    
    override func finish() {
        print("AIRPORT COORDINATOR FINISHED")
    }
}
