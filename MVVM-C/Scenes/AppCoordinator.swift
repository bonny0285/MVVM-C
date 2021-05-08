//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
    }()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        guard let window = window else { return }
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        let airportCoordinator = AirportCoordinator(rootNavigationController: rootViewController)
        addChildCoordinator(airportCoordinator)
        airportCoordinator.start(allowsReturnToPreviousCoordinator: allowsReturnToPreviousCoordinator)
    }
    
    override func finish() {}
    
}

