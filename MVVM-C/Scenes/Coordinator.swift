//
//  Coordinator.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

class Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    func start(allowsReturnToPreviousCoordinator: Bool = false) {}
    
    func finish() {}
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(of: coordinator) {
            childCoordinators.remove(at: index)
        } else {
            print("Impossibile rimuovere il coordinator: \(coordinator). non è un coordinator child")
        }
    }
    
    func removeAllChildCoordinatorWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T == false }
    }
    
    func removeAllChildCoordinator() {
        childCoordinators.removeAll()
    }
}


extension Coordinator: Equatable {
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }
}
