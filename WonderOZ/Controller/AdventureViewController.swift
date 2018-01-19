//
//  AdventureViewController.swift
//  WonderOz
//
//  Created by Jason-Zhuang on 19/1/18.
//  Copyright © 2018 Zhangzixi. All rights reserved.
//

import UIKit

class AdventureViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //============================================//
    var adventureDataInstance: AdventureData?
    var adventureMap: Dictionary<Int, Adventure>?
    var itemCount: Int = 0;
    
    //============================================//
    @IBOutlet weak var tableView: UITableView!

    //============================================//
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.adventureDataInstance = AdventureData.adventureInstance;
        self.itemCount = self.adventureDataInstance!.getAdventuresByCategory(category: Category.camping, returnMap: &adventureMap!)
        tableView.delegate   = self;
        tableView.dataSource = self;
        
        //adventure[1]?.title="TTTTTTTTTTTTT"
        //print(String(describing: adventure[1]?.title))
        print("=============================")
        
        
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0;
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adventureCell");
        cell?.textLabel?.text = "test";
        return cell!;
    }

}
