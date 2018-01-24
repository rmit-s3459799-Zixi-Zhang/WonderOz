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
    static let adventureInstance = AdventureData(argName: "WonderOZ");
    
    //the name of the application
    let applicationName: String;
    
    //The adventure Map key is adventure.itemId and value is Adventure class
    var adventureMap : Dictionary<Int, Adventure>?;
    
    //
    var adventureCategories: [CategoryClass]?;
   
    
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
        
        //=========================================================//
        let myAdventure1: Adventure = Adventure(itemId: 1, category: Category.camping);
        myAdventure1.title = "Burden Park";
        myAdventure1.address = "Springvale South 3172, Victoria, Australia";
        myAdventure1.mapPosition.latitude  = "-38.209817";
        myAdventure1.mapPosition.longitude = "144.514998";
        myAdventure1.rate = 0;
        myAdventure1.distance = 12.5;
        myAdventure1.favourite = false;
        myAdventure1.itemImages = [#imageLiteral(resourceName: "camping1-1"), #imageLiteral(resourceName: "camping1-2")];
        myAdventure1.description = "Plenty of shelters, tables and BBQs. \n The playground had a bit of an upgrade in 2013 with some fresh paint and a wooden maze.";
        myAdventure1.comments = ["I remember going as a child just after it was built. It was lots of fun but my parents never let me use the bathroom facilities due to drugs and I was almost abducted from the playground and my older brother saved me.","I helped to build this playground... I think in 1994? It was a community partnership build playground. There is another one like it in Pakenham."]
        returnValue.updateValue(myAdventure1, forKey: myAdventure1.itemId);
        //=========================================================//
        let myAdventure2: Adventure = Adventure(itemId: 2, category: Category.camping);
        myAdventure2.title = "Great Otway National Park";
        myAdventure2.address = "Great Ocean Rd, Glenaire VIC 3238";
        myAdventure2.mapPosition.latitude  = "-38.209817";
        myAdventure2.mapPosition.longitude = "144.514998";
        myAdventure2.rate = 0;
        myAdventure2.distance = 110;
        myAdventure2.favourite = true;
        myAdventure2.itemImages = [#imageLiteral(resourceName: "camping2-1"), #imageLiteral(resourceName: "camping2-2")];
        myAdventure2.description = "The Great Otway National Park stretches from Torquay through to Princetown and up through the Otways hinterland towards Colac. The park features rugged coastlines, sandy beaches, rock platforms and windswept heathland. In the north, the park features tall forests, ferny gullies, magnificent waterfalls and tranquil lakes.";
        myAdventure2.comments = ["Just got back from this place and the location is pretty good.","No power Or water but well maintained and quiet."]
        returnValue.updateValue(myAdventure2, forKey: myAdventure2.itemId);
        //=========================================================//
        let myAdventure3: Adventure = Adventure(itemId: 3, category: Category.fishing);
        myAdventure3.title = "Patterson Fishing Spot";
        myAdventure3.address = "606 Nepean Hwy, Bonbeach VIC 3196";
        myAdventure3.mapPosition.latitude = "-38.209817";
        myAdventure3.mapPosition.longitude = "144.514998";
        myAdventure3.rate = 0;
        myAdventure3.distance = 50;
        myAdventure3.favourite = false;
        myAdventure3.itemImages = [#imageLiteral(resourceName: "fishing1-1"), #imageLiteral(resourceName: "fishing1-2")];
        myAdventure3.description = "Patterson Lakes is a relatively new development area in the southern suburbs of Melbourne, adjoining the suburb of Carrum and a short distance from Edithvale and Seaford beaches. The estuary just after the entrance to Port Phillip Bay has been channelled, with housing developments having private access to the water and main river.";
        myAdventure3.comments = ["Great place for fishing. Lil bit hard to find parking though but u can park at station and walk!!!","good!"];
        returnValue.updateValue(myAdventure3, forKey: myAdventure3.itemId);
        //=========================================================//
        let myAdventure4: Adventure = Adventure(itemId: 4, category: Category.fishing);
        myAdventure4.title = "Hastings Spot on Fishing Tackle";
        myAdventure4.address = "606 Nepean Hwy, Bonbeach VIC 3196";
        myAdventure4.mapPosition.latitude = "-38.209817";
        myAdventure4.mapPosition.longitude = "144.514998";
        myAdventure4.rate = 0;
        myAdventure4.distance = 50;
        myAdventure4.favourite = true;
        myAdventure4.itemImages = [#imageLiteral(resourceName: "fishing2-1"), #imageLiteral(resourceName: "fishing2-2")];
        myAdventure4.description = "Our membership consists of individually owned and operated retailers who have an interest in their community and can pass on good local knowledge on fishing, camping and places of interest.";
        myAdventure1.comments = ["Great guys very helpful good service every thing you need is there.","good!"]
        returnValue.updateValue(myAdventure4, forKey: myAdventure4.itemId);
        
        //=========================================================//
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
