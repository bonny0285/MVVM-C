//
//  User.swift
//  MVVM-C
//
//  Created by Massimiliano on 09/05/21.
//

import Foundation


class User {
    var username: String
    var password: String
    var isCurrentAccount: Bool
    
    init(username: String, password: String, isCurrentAccount: Bool) {
        self.username = username
        self.password = password
        self.isCurrentAccount = isCurrentAccount
    }
}
