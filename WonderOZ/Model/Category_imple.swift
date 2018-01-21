//
//  Category_imple.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/21.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import Foundation

class CategoryData{
    
    var cateMap : Dictionary<Int, category>? = nil;
    
    static let cateInstance = CategoryData();
    
    init() {
        self.cateMap = initCategoryData();
    }
    
    func initCategoryData() -> Dictionary<Int, category>{
        
        var returnValue = [Int: category]();
        
        returnValue.updateValue(category("camping",10,Category.camping,#imageLiteral(resourceName: "camping")), forKey: 0);
        returnValue.updateValue(category("fishing",15,Category.fishing,#imageLiteral(resourceName: "fishing1")), forKey: 1);
        
        return returnValue;
    }
    
    func getCategoryList() -> [category]
    {
        var categoryList = [category]();
        for objKey in (cateMap?.keys)!
        {
            categoryList.append(cateMap![objKey]!);
        }
        return categoryList;
    }
    
}
