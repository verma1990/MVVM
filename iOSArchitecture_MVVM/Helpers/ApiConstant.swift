//
//  ApiConstant.swift
//  iOSArchitecture_MVVM
//
//  Created by Amit Verma on 15/03/2019.
//  Copyright © 2019 Amit Verma. All rights reserved.
//

import UIKit

enum Config {
    
    // Copy base url here
    
    #if DEVELOPMENT
    static let BASE_URL:String = "SERVER_URL"
    #else
    static let BASE_URL:String = "SERVER_URL"
    #endif
    
    // All end points will be here
    static let login = "registration_ctrl/login"
    
}


enum Keys {
    static let email    = "email"
    static let password = "password"

}
