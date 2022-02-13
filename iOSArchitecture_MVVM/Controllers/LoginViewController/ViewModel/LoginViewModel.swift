//
//  LoginViewModel.swift
//  iOSArchitecture_MVVM
//
//  Created by Amit Verma on 14/03/2019.
//  Copyright © 2019 Amit Verma. All rights reserved.
//

import UIKit

class LoginViewModel: BaseViewModel {
    
    // MARK: Variables
    
    var userService: UserServiceProtocol
    
    // MARK: Initialization
    
    // Putting dependency injection by paasing the service object in constructor and not giving the responsibility for the same to LoginViewModel
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    // MARK: Validation Methods
    
    func isValid(email: String?, password: String?) -> (isValid: Bool, error: String?) {
        guard let mail = email, mail.isValidEmail() else {
            return (false, AlertMessage.INVALID_EMAIL)
        }
        
        guard let pswd = password, pswd.count >= 6 else {
            return (false, AlertMessage.INVALID_PASSWORD)
        }
        return (true, nil)
    }
    
    func login(withEmail email: String?, password: String?) {
        
        let validationTuple = isValid(email: email, password: password)
        guard validationTuple.isValid, let email = email, let password = password else {
            self.errorMessage = validationTuple.error
            return
        }
        self.loginApi(email, password: password)
    }
    
    // MARK: Api Methods
    
    func loginApi(_ email: String, password: String) {
        self.isLoading = true
        
        userService.doLogin(email: email, password: password) { (result) in
           self.isLoading = false
            switch result {
            case .Success(let data):
                self.isSuccess = true
            case .Error(let message):
                self.isSuccess = false
                self.errorMessage = message
            }
        }
    }
}
