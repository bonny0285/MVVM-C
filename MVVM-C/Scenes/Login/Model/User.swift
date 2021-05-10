//
//  User.swift
//  MVVM-C
//
//  Created by Massimiliano on 09/05/21.
//

import Foundation

enum UserError: String, Error {
    case userAlreadySaved = "User already saved"
}

class User: Codable, Equatable {
    
    
    var username: String
    var password: String
    var isCurrentAccount: Bool
    
    init(username: String, password: String, isCurrentAccount: Bool) {
        self.username = username
        self.password = password
        self.isCurrentAccount = isCurrentAccount
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username
    }
}


class DataBaseLogin {
    
    private let userDefault = UserDefaults.standard
    
    private var usersContainer: [String : User] = [:]
    
    init() {
        usersContainer = userDefault.array(forKey: "users") as? [String : User] ?? [:]
    }
    
    
    
    
    private func saveUser() {}
    
    func saveUser(_ user: User, completion: (Result<Bool,UserError>) -> Void) {
        
        if let _ = usersContainer["\(user.username)"] {
            // Gestire in caso di utente gia salvato
            completion(.failure(.userAlreadySaved))
        } else {
            // Gestire in caso di utente non presente nel DB
            usersContainer["\(user.username)"] = user
            
            //do {
                //let encoded = try JSONEncoder().encode(user)
                //userDefault.set(encoded, forKey: "user\(user.username)")
                //userDefault.synchronize()
                
            //} catch let error {
              //  print(error.localizedDescription)
            //}
        }
    }
    
    func retriveUser(_ user: User) -> User {
        var result: User?
        
        if let user = userDefault.object(forKey: "user\(user.username)") as? Data {
        
            do {
                result = try JSONDecoder().decode(User.self, from: user)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return result ?? User(username: "", password: "", isCurrentAccount: false)
    }
}


/*
 
 Processo di salvataggio:
 
 - Controllare che il nuovo user non è gia presente nel container altrimenti mostrare un alert di errore, gestire il caso con un closure che ritorna failure.
 - In caso che il nuovo user non è presente mostrare un alert di avvenuta registrazione, gestire il caso con una closure che ritorna success
 
 Processo di retrive:
 
 - Controllare che l'user sia presente e gestire il caso con una closure che ritarna l'user in caso di success oppure failure in caso contrario
 
 */
