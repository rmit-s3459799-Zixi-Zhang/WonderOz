//
//  ProfileData.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/22.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import Foundation

class Profile {
    
    var Username : String;
    var Useremail : String;
    var Useraddress : String;
    var Userphone : String;
    
    static let profileInstance = Profile();
    var storedData : Profile?;
    
    /*init(_ name:String, _ email:String, _ address:String, _ phone:String) {
        Username = name;
        Useremail = email;
        Useraddress = address;
        Userphone = phone;
    }*/
    init() {
        self.Username = "Jefferry";
        self.Useremail = "abc@gmail.com"
        self.Useraddress = "123 Ave St"
        self.Userphone = "043212345"
    }
    
    /*func InitData() -> Profile {
        let InitValue = Profile("Jefferry","abc@gmail.com","043212345","123 Ave St");
        
        /*InitValue.Username = "Jefferry";
        InitValue.Useremail = "abc@gmail.com";
        InitValue.Userphone = "043212345";
        InitValue.Useraddress = "123 Ave St";*/
        
        return InitValue;
    }*/
}
