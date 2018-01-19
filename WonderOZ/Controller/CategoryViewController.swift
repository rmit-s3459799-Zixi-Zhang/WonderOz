//
//  CategoryViewController.swift
//  WonderOz
//
//  Created by Jason-Zhuang on 19/1/18.
//  Copyright © 2018 Zhangzixi. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var adventure: Dictionary<Int, Adventure> = AdventureData.adventureInstance.adventureMap!;
        adventure[1]?.title="XXXXXXXX"
        print(String(describing: adventure[1]?.title))
    }

  

}
