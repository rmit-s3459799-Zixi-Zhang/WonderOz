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

    var adventureCategories: [CategoryClass]?;
    
    static let adventureInstance = AdventureData(argName: "WonderOZ");
    
    init(argName:String)
    {
        self.applicationName = argName;
        self.adventureMap = initAdventureData();
        self.adventureCategories = initAdventureCategories();
    }
    
    func initAdventureCategories() -> [CategoryClass]
    {
        var returnValue = [CategoryClass]();
        
        let category1: CategoryClass = CategoryClass(categoryName: "camping", adventures: getAdventuresByCategory(category: .camping))
        let category2: CategoryClass = CategoryClass(categoryName: "fishing", adventures: getAdventuresByCategory(category: .fishing))
        let category3: CategoryClass = CategoryClass(categoryName: "hiking" , adventures: getAdventuresByCategory(category: .hiking))
        let category4: CategoryClass = CategoryClass(categoryName: "surfing", adventures: getAdventuresByCategory(category: .surfing))
        let category5: CategoryClass = CategoryClass(categoryName: "biking" , adventures: getAdventuresByCategory(category: .biking))
        let category6: CategoryClass = CategoryClass(categoryName: "diving" , adventures: getAdventuresByCategory(category: .diving))
        
        returnValue.append(category1);
        returnValue.append(category2);
        returnValue.append(category3);
        returnValue.append(category4);
        returnValue.append(category5);
        returnValue.append(category6);
        
        return returnValue;
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
        myAdventure1.rate = 5;
        myAdventure1.distance = 0;
        myAdventure1.favourite = true;
        myAdventure1.itemImages = [#imageLiteral(resourceName: "camping1-1"), #imageLiteral(resourceName: "camping1-2"), #imageLiteral(resourceName: "camping1-3"), #imageLiteral(resourceName: "camping1-4")];
        myAdventure1.description = "AAAAAAAAAAAAAAAAA";
        myAdventure1.comments = ["Adventure Comment1","Comment 2"]
        returnValue.updateValue(myAdventure1, forKey: myAdventure1.itemId);
        
        let myAdventure2: Adventure = Adventure(itemId: 2, category: Category.camping);
        myAdventure2.title = "Friday's Camp Ground";
        myAdventure2.address = "Steiglitz-Durdidwarrah Rd, Steiglitz VIC 3331";
        myAdventure2.mapPosition.latitude = "-37.860050";
        myAdventure2.mapPosition.longitude = "144.189826";
        myAdventure2.rate = 4;
        myAdventure2.distance = 0;
        myAdventure2.favourite = false;
        myAdventure2.itemImages = [#imageLiteral(resourceName: "camping2-1"), #imageLiteral(resourceName: "camping2-2"), #imageLiteral(resourceName: "camping2-3"), #imageLiteral(resourceName: "camping2-4")];
        myAdventure2.description = "BBBBBBBBBBBBBBB"
        myAdventure2.comments = ["Adventure Comment1","Comment 2"]
        returnValue.updateValue(myAdventure2, forKey: myAdventure2.itemId);
        
        let myAdventure3: Adventure = Adventure(itemId: 3, category: Category.fishing);
        myAdventure3.title = "Patterson Fishing Spot";
        myAdventure3.address = "606 Nepean Hwy, Bonbeach VIC 3196";
        myAdventure3.mapPosition.latitude = "-38.072604";
        myAdventure3.mapPosition.longitude = "145.120154";
        myAdventure3.rate = 2;
        myAdventure3.distance = 0;
        myAdventure3.favourite = false;
        myAdventure3.itemImages = [#imageLiteral(resourceName: "fishing1-1"), #imageLiteral(resourceName: "fishing1-2"), #imageLiteral(resourceName: "fishing1-3"), #imageLiteral(resourceName: "fishing1-4")];
        myAdventure3.description = "CCCCCCCCCCCCCCCCCCC"
        myAdventure3.comments = ["Adventure Comment1","Comment 2"]
        returnValue.updateValue(myAdventure3, forKey: myAdventure3.itemId);
        
        let myAdventure4: Adventure = Adventure(itemId: 4, category: Category.fishing);
        myAdventure4.title = "Melbourne Fishing Charters";
        myAdventure4.address = "1 Pier Rd, St Kilda VIC 3182";
        myAdventure4.mapPosition.latitude = "-37.864301";
        myAdventure4.mapPosition.longitude = "144.965251";
        myAdventure4.rate = 3;
        myAdventure4.distance = 0;
        myAdventure4.favourite = true;
        myAdventure4.itemImages = [#imageLiteral(resourceName: "fishing2-1"), #imageLiteral(resourceName: "fishing2-2"), #imageLiteral(resourceName: "fishing2-3"), #imageLiteral(resourceName: "fishing2-4")];
        myAdventure4.description = "DDDDDDDDDDDDDDDDDDDD"
        myAdventure4.comments = ["Adventure Comment1","Comment 2"]
        returnValue.updateValue(myAdventure4, forKey: myAdventure4.itemId);
        
        
        return returnValue;
    }
    
    //get Array of all Adventure list
    func getAdventuresList() -> [Adventure]
    {
        var adventureList = [Adventure]();
        for objKey in (adventureMap?.keys)!
        {
            adventureList.append(adventureMap![objKey]!);
        }
        return adventureList;
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
    
    //Get a Array of Adventure by category
    func getAdventuresByCategory(category:Category) -> [Adventure]
    {
        var adventureList = [Adventure]();
        for objKey in (adventureMap?.keys)!
        {
            let myAdventure: Adventure = adventureMap![objKey]!;
            
            if category == myAdventure.category
            {
                adventureList.append(myAdventure);
            }
        }
        return adventureList;
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
    
    //Get a Array of My favorite Adventure by category
    func getFavouriteAdventures(category:Category) -> [Adventure]
    {
        var adventureList = [Adventure]();
        for objKey in (adventureMap?.keys)!
        {
            let myAdventure: Adventure = adventureMap![objKey]!;
            
            if category == myAdventure.category && myAdventure.favourite == true
            {
                adventureList.append(myAdventure);
            }
        }
        return adventureList;
    }
    
    //Get a Array of My favorite Adventure by category
    func getFavouriteCategories() -> [CategoryClass]
    {
        var returnValue = [CategoryClass]();
        
        let category1: CategoryClass = CategoryClass(categoryName: "camping", adventures: getFavouriteAdventures(category: .camping))
        let category2: CategoryClass = CategoryClass(categoryName: "fishing", adventures: getFavouriteAdventures(category: .fishing))
        let category3: CategoryClass = CategoryClass(categoryName: "hiking" , adventures: getFavouriteAdventures(category: .hiking))
        let category4: CategoryClass = CategoryClass(categoryName: "surfing", adventures: getFavouriteAdventures(category: .surfing))
        let category5: CategoryClass = CategoryClass(categoryName: "biking" , adventures: getFavouriteAdventures(category: .biking))
        let category6: CategoryClass = CategoryClass(categoryName: "diving" , adventures: getFavouriteAdventures(category: .diving))
        
        returnValue.append(category1);
        returnValue.append(category2);
        returnValue.append(category3);
        returnValue.append(category4);
        returnValue.append(category5);
        returnValue.append(category6);
        
        return returnValue;
       
    }
    
    
}
