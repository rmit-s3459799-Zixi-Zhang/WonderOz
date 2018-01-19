//
//  AdventureData.swift
//  WonderOz
//
//  Created by Jason-Zhuang on 19/1/18.
//  Copyright © 2018 Zhangzixi. All rights reserved.
//

import Foundation

class AdventureData
{
    var applicationName: String;
    
    var adventureMap : Dictionary<Int, Adventure>?;
    
    static let adventureInstance = AdventureData(argName: "WonderOZ");
    
    init(argName:String)
    {
        self.applicationName = argName;
        self.adventureMap = initAdventureData();
    }
    
    func initAdventureData() -> Dictionary<Int, Adventure>
    {
        var returnValue = [Int: Adventure]();
        
        //=====================
        let myAdventure1: Adventure = Adventure(itemId: 1, category: Category.camping);
        myAdventure1.title = "Adventure Park Geelong - Victoria";
        myAdventure1.address = "1249 Bellarine Hwy, Wallington VIC 3222";
        myAdventure1.mapPosition.latitude = "-38.209817";
        myAdventure1.mapPosition.longitude = "144.514998";
        myAdventure1.rate = 0;
        myAdventure1.distance = 0;
        myAdventure1.favourite = false;
        myAdventure1.itemImages = [#imageLiteral(resourceName: "camping1-1"), #imageLiteral(resourceName: "camping1-2"), #imageLiteral(resourceName: "camping1-3"), #imageLiteral(resourceName: "camping1-4")];
        returnValue.updateValue(myAdventure1, forKey: myAdventure1.itemId);
        
        let myAdventure2: Adventure = Adventure(itemId: 2, category: Category.camping);
        myAdventure2.title = "Friday's Camp Ground";
        myAdventure2.address = "Steiglitz-Durdidwarrah Rd, Steiglitz VIC 3331";
        myAdventure2.mapPosition.latitude = "-37.860050";
        myAdventure2.mapPosition.longitude = "144.189826";
        myAdventure2.rate = 0;
        myAdventure2.distance = 0;
        myAdventure2.favourite = false;
        myAdventure2.itemImages = [#imageLiteral(resourceName: "camping2-1"), #imageLiteral(resourceName: "camping2-2"), #imageLiteral(resourceName: "camping2-3"), #imageLiteral(resourceName: "camping2-4")];
        returnValue.updateValue(myAdventure2, forKey: myAdventure2.itemId);
        
        let myAdventure3: Adventure = Adventure(itemId: 3, category: Category.fishing);
        myAdventure3.title = "Patterson Fishing Spot";
        myAdventure3.address = "606 Nepean Hwy, Bonbeach VIC 3196";
        myAdventure3.mapPosition.latitude = "-38.072604";
        myAdventure3.mapPosition.longitude = "145.120154";
        myAdventure3.rate = 0;
        myAdventure3.distance = 0;
        myAdventure3.favourite = false;
        myAdventure3.itemImages = [#imageLiteral(resourceName: "fishing1-1"), #imageLiteral(resourceName: "fishing1-2"), #imageLiteral(resourceName: "fishing1-3"), #imageLiteral(resourceName: "fishing1-4")];
        returnValue.updateValue(myAdventure3, forKey: myAdventure3.itemId);
        
        let myAdventure4: Adventure = Adventure(itemId: 4, category: Category.fishing);
        myAdventure4.title = "Melbourne Fishing Charters";
        myAdventure4.address = "1 Pier Rd, St Kilda VIC 3182";
        myAdventure4.mapPosition.latitude = "-37.864301";
        myAdventure4.mapPosition.longitude = "144.965251";
        myAdventure4.rate = 0;
        myAdventure4.distance = 0;
        myAdventure4.favourite = false;
        myAdventure4.itemImages = [#imageLiteral(resourceName: "fishing2-1"), #imageLiteral(resourceName: "fishing2-2"), #imageLiteral(resourceName: "fishing2-3"), #imageLiteral(resourceName: "fishing2-4")];
        returnValue.updateValue(myAdventure4, forKey: myAdventure4.itemId);
        
        
        return returnValue;
    }
    
    //Get Adventures by category from database or data Structue
    func getAdventuresByCategory(category:Category, returnMap: inout [Int:Adventure]) -> Int
    {
        for (aKey,aValue) in adventureMap!
        {
            if (aValue.category == category)
            {
                returnMap.updateValue(aValue, forKey: aKey)
            }
        }
        return returnMap.count;
    }
    
    //Get my favourite Adventures from database or data Structue
    func getFavouriteAdventures(returnMap: inout [Int:Adventure]) -> Int
    {
        for (aKey,aValue) in adventureMap!
        {
            if (aValue.favourite == true)
            {
                returnMap.updateValue(aValue, forKey: aKey)
            }
        }
        return returnMap.count;
    }
    
    
}
