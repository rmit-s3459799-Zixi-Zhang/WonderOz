//
//  ProfileController.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/22.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var Name_label: UILabel!
    @IBOutlet weak var Email_label: UILabel!
    @IBOutlet weak var Address_label: UILabel!
    @IBOutlet weak var Phone_label: UILabel!
    
    
    
    @IBAction func EditButton(_ sender: Any) {
        self.performSegue(withIdentifier: "EditTransferSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //print("Test")
        
        Name_label.text = Profile.profileInstance.Username;
        Email_label.text = Profile.profileInstance.Useremail;
        Address_label.text = Profile.profileInstance.Useraddress;
        Phone_label.text = Profile.profileInstance.Userphone;
        
        //print(Name_label.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
