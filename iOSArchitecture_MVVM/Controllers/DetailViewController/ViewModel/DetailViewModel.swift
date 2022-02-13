//
//  DetailViewModel.swift
//  iOSArchitecture_MVVM
//
//  Created by Amit Verma on 15/03/2019.
//  Copyright © 2019 Amit Verma. All rights reserved.
//

import UIKit

class DetailViewModel: BaseViewModel {
    
    private var listingObj: Listing?
    
    override init() {
        super.init()
    }
    
    convenience init(with object : Listing) {
        self.init()
        
        self.listingObj = object
    }
    
}
