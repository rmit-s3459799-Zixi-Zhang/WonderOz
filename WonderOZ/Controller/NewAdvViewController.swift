//
//  NewAdvViewController.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/23.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import UIKit

class NewAdvViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate
{

    //var adventureLst = AdventureData.adventureInstance.adventureMap
    var adventure: Adventure?
    var Picker_index:Int = 0
    
    @IBOutlet weak var TitleText: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var cate: UITextField!
    @IBOutlet weak var Descript: UITextView!
 
    @IBOutlet weak var CatePicker: UIPickerView!
    
    @IBAction func saveFunc(_ sender: Any)
    {
        if TitleText.text! == ""
        {
            popOverWindow(msg: "Please input the Adventure Name!")
            TitleText.backgroundColor = UIColor.yellow
            return;
        }
        let count = AdventureData.adventureInstance.adventureMap?.count;
        adventure = Adventure(itemId: (count! + 1), category: Category.camping)
        adventure?.title = TitleText.text!
        adventure?.address = location.text!
        adventure?.description = Descript.text!
        adventure?.category = getCategory(index: Picker_index)
        adventure?.itemImages = [UIImage(named: "logo")!]
        //print("Test")
        //print(adventure?.title)
        //print(adventure?.address)
        //print(adventure?.category)
        //print( (adventureLst?.count)!)
        AdventureData.adventureInstance.adventureMap?.updateValue(adventure!, forKey: (adventure?.itemId)!);
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    var cate_string = ["camping", "fishing", "hiking", "surfing", "biking", "diving"]
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return cate_string.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        self.view.endEditing(true)
        return cate_string[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.cate.text = self.cate_string[row]
        self.CatePicker.isHidden = true
        Picker_index = row
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == self.cate
        {
            self.CatePicker.isHidden = false
            textField.endEditing(true)
        }
    }
    
    func getCategory(index: Int) -> Category
    {
        
        switch index {
        case 0:
            return Category.camping
        case 1:
            return Category.fishing
        case 2:
            return Category.hiking
        case 3:
            return Category.surfing
        case 4:
            return Category.biking
        case 5:
            return Category.diving
        default:
            return Category.camping
            
        }
    
    }
    
    
    @IBAction func camaraClicked(_ sender: UIButton)
    {
        popOverWindow(msg: "This function which involves using camara device \n will be implemented in Assignment 2")
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

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
