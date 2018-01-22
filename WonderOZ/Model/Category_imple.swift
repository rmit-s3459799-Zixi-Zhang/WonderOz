//
//  Category_imple.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/21.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import Foundation

class CategoryData{
    
    //var cateMap : Dictionary<Int, category>? = nil;
    var cateMap = [category]()
    
    static let cateInstance = CategoryData();
    
    init() {
        self.cateMap = initCategoryData();
        
    }
    
    func initCategoryData() -> [category]{
        cateMap.reserveCapacity(6);
        var returnValue = [category]()
        returnValue.reserveCapacity(6)
        
        returnValue.append(category("camping",10,Category.camping,#imageLiteral(resourceName: "camping")));
        returnValue.append(category("fishing",15,Category.fishing,#imageLiteral(resourceName: "fishing1")));
        returnValue.append(category("hiking",14,Category.hiking,#imageLiteral(resourceName: "park2")));
        returnValue.append(category("surfing",18,Category.surfing,#imageLiteral(resourceName: "surfing")));
        returnValue.append(category("biking",20,Category.biking,#imageLiteral(resourceName: "park3")));
        returnValue.append(category("Diving",5, Category.diving,#imageLiteral(resourceName: "fishing2")));
        /*returnValue.updateValue(category("camping",10,Category.camping,#imageLiteral(resourceName: "camping")), forKey: 0);
        returnValue.updateValue(category("fishing",15,Category.fishing,#imageLiteral(resourceName: "fishing1")), forKey: 1);
        returnValue.updateValue(category("hiking",14,Category.hiking,#imageLiteral(resourceName: "park2")), forKey: 2);
        returnValue.updateValue(category("surfing",18,Category.surfing,#imageLiteral(resourceName: "surfing")), forKey: 3);
        returnValue.updateValue(category("biking",20,Category.biking,#imageLiteral(resourceName: "park3")), forKey: 4);
        returnValue.updateValue(category("Diving",5, Category.diving,#imageLiteral(resourceName: "fishing2")), forKey: 5)*/
        
        
        return returnValue;
    }
    
    func getCategoryList() -> [category]
    {
        /*var categoryList = [category]();
        for objKey in (cateMap?.keys)!
        {
            categoryList.append(cateMap![objKey]!);
        }*/
        return cateMap;
    }
    
}
