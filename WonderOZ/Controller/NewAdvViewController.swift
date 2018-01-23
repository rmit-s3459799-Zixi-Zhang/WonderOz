//
//  NewAdvViewController.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/23.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import UIKit

class NewAdvViewController: UIViewController {

    var adventureLst = AdventureData.adventureInstance.adventureMap
    var adventure: Adventure?
    
    @IBOutlet weak var tit: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var cate: UITextField!
    @IBOutlet weak var Descript: UITextView!
 
    @IBAction func saveFunc(_ sender: Any) {
        //adventure = Adventure((adventureLst?.count)! + 1, nil)
        adventureLst?.updateValue(Adventure(itemId: (adventureLst?.count)! + 1, category: Category.camping), forKey: (adventureLst?.count)! + 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
