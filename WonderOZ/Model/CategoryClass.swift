//
//  CategoryClass.swift
//  WonderOZ
//
//  Created by Jason-Zhuang on 21/1/18.
//  Copyright © 2018 iOSWorld. All rights reserved.
//

import Foundation

class CategoryClass
{
    var categoryName: String
    
    var adventureList: [Adventure]
    
    init(categoryName: String, adventures:[Adventure])
    {
        self.categoryName = categoryName;
        self.adventureList = adventures;
    }
    
}
