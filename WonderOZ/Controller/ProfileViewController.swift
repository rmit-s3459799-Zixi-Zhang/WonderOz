//
//  ProfileViewController.swift
//  WonderOZ
//
//  Created by Jason-Zhuang on 22/1/18.
//  Copyright © 2018 iOSWorld. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.lblName.text  = ProfileData.profileInstance.Username;
        self.lblEmail.text = ProfileData.profileInstance.Useremail;
        self.lblAddress.text = ProfileData.profileInstance.Useraddress;
        self.lblPhone.text = ProfileData.profileInstance.Userphone;
        self.profileImage.image = ProfileData.profileInstance.Userimage;
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.lblName.text  = ProfileData.profileInstance.Username;
        self.lblEmail.text = ProfileData.profileInstance.Useremail;
        self.lblAddress.text = ProfileData.profileInstance.Useraddress;
        self.lblPhone.text = ProfileData.profileInstance.Userphone;
        self.profileImage.image = ProfileData.profileInstance.Userimage;
    }
    
    
    @IBAction func openCamara(_ sender: UIButton)
    {
        popOverWindow(msg: "This function which involves using camara device \n will be implemented in Assignment 2")
    }
    
    func popOverWindow(msg:String)
    {
        let popOverVC = UIStoryboard(name:"Main", bundle:nil);
        let pp = popOverVC.instantiateViewController(withIdentifier: "sbPopUpId") as! PopupViewController;
        pp.mess = msg;
        pp.view.frame = self.view.frame;
        self.addChildViewController(pp);
        self.view.addSubview(pp.view);
        pp.didMove(toParentViewController: self);
    }
   

}
