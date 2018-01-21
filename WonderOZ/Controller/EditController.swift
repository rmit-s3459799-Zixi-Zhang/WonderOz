//
//  EditController.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/22.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import UIKit

class EditController: UIViewController {

    @IBOutlet weak var Name_Imple: UITextField!
    @IBOutlet weak var Email_Imple: UITextField!
    @IBOutlet weak var Address_Imple: UITextField!
    @IBOutlet weak var Phone_Imple: UITextField!
    
    @IBOutlet weak var Present_Name: UILabel!
    
    @IBAction func SaveButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SaveTransferSegue", sender: self)
        print(Name_Imple.text!)
        
        if Name_Imple.text != nil { Profile.profileInstance.Username = Name_Imple.text! }
        if Email_Imple.text != nil { Profile.profileInstance.Useremail = Email_Imple.text! }
        if Address_Imple.text != nil { Profile.profileInstance.Useraddress = Address_Imple.text! }
        if Phone_Imple.text != nil { Profile.profileInstance.Userphone = Phone_Imple.text! }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Present_Name.text = Profile.profileInstance.Username;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
