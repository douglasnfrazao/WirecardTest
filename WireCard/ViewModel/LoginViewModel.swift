//
//  LoginViewModel.swift
//  WireCard
//
//  Created by Douglas Nunes on 02/06/19.
//  Copyright © 2019 douglasnunes. All rights reserved.
//

import Foundation

class LoginViewModel {
    private let loginBusiness: LoginBusiness = LoginBusiness()
    var completion: (LoginState) -> Void = { _ in }
    
    enum LoginState {
        case failure(Error)
        case success
    }
    
    func login(email: String, password: String) {
        loginBusiness.login(username: email, password: password) { [weak self] result in
            if result.result != nil {
                self?.completion(.success)
            } else {
                self?.completion(.failure(result.error!))
            }
        }
    }

}
