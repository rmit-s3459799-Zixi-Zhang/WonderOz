//
//  NewAdvViewController.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/23.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import UIKit

class NewAdvViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    var adventureLst = AdventureData.adventureInstance.adventureMap
    var adventure: Adventure?
    var Picker_index:Int = 0
    
    @IBOutlet weak var TitleText: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var cate: UITextField!
    @IBOutlet weak var Descript: UITextView!
 
    @IBOutlet weak var CatePicker: UIPickerView!
    
    @IBAction func saveFunc(_ sender: Any) {
        adventure = Adventure(itemId: ((adventureLst?.count)! + 1), category: Category.camping)
        adventure?.title = TitleText.text!
        adventure?.address = location.text!
        adventure?.description = Descript.text!
        adventure?.category = getCategory(index: Picker_index)
        print("Test")
        print(adventure?.title)
        print(adventure?.address)
        print(adventure?.category)
        print( (adventureLst?.count)!)
        adventureLst?.updateValue(adventure!, forKey: (adventure?.itemId)!)
    }
    var cate_string = ["Camping", "Fishing", "Hiking", "Surfing", "Biking", "Diving"]
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cate_string.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return cate_string[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.cate.text = self.cate_string[row]
        self.CatePicker.isHidden = true
        Picker_index = row
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.cate{
            self.CatePicker.isHidden = false
            textField.endEditing(true)
        }
    }
    
    func getCategory(index: Int) -> Category {
        
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
    
    /*func textFieldDidBeginEditing(textField: UITextField) {
        if textField == location {
            animateViewMoving(up: true, moveValue: 100)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == location {
            animateViewMoving(up: false, moveValue: 100)
        }
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        //self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
