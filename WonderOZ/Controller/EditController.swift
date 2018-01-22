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
        //self.performSegue(withIdentifier: "SaveTransferSegue", sender: self)
        self.dismiss(animated: true, completion: {
            self.performSegue(withIdentifier: "SaveTransferSegue", sender: self)
        })
        
        
        if Name_Imple.text != "" { Profile.profileInstance.Username = Name_Imple.text! }
        if Email_Imple.text != "" { Profile.profileInstance.Useremail = Email_Imple.text! }
        if Address_Imple.text != "" { Profile.profileInstance.Useraddress = Address_Imple.text! }
        if Phone_Imple.text != "" { Profile.profileInstance.Userphone = Phone_Imple.text! }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Present_Name.text = Profile.profileInstance.Username;
        Name_Imple.text = Profile.profileInstance.Username;
        Email_Imple.text = Profile.profileInstance.Useremail;
        Address_Imple.text = Profile.profileInstance.Useraddress;
        Phone_Imple.text = Profile.profileInstance.Userphone;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
