//
//  AdvDetailViewController.swift
//  WonderOZ
//
//  Created by Jason-Zhuang on 20/1/18.
//  Copyright © 2018 iOSWorld. All rights reserved.
//

import UIKit

class AdvDetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    ////
    var adventure: Adventure?
    
    ///
    @IBOutlet weak var adventureImageView: UIImageView!
    @IBOutlet weak var describtionText: UITextView!
    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var adventureTitle: UILabel!
    
    @IBOutlet weak var btnStar1: UIButton!
    @IBOutlet weak var btnStar2: UIButton!
    @IBOutlet weak var btnStar3: UIButton!
    @IBOutlet weak var btnStar4: UIButton!
    @IBOutlet weak var btnStar5: UIButton!
    
    
    ///
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        //self.adventure = AdventureData.adventureInstance.adventureMap?[adventureId]
        adventureTitle.text = adventure?.title;
        adventureImageView.image = adventure?.itemImages[0]
        describtionText.text = adventure?.description
        if (adventure?.itemId)!%2 == 0
        {
            mapImageView.image = UIImage(named: "map1")
        }else
        {
            mapImageView.image = UIImage(named: "map2")
        }
        //
        btnStar1.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar2.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar3.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar4.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar5.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        //
        tableView.reloadData();
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let count:Int = (self.adventure?.comments.count)!;
        return count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let comment = self.adventure?.comments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentViewCell", for: indexPath) as! ComntTableViewCell
        //let adventure = self.adventureLst[indexPath.row]
        //let cell = tableView.dequeueReusableCell(withIdentifier: "adventureViewCell", for: indexPath) as! AdvTableViewCell
        cell.commentTextView.text = comment;
        cell.btnDelete.tag = indexPath.row;
        return cell;
    }
    
    
    //
    @IBAction func btnSend(_ sender: UIButton)
    {
        adventure?.comments.append(inputTextField.text!)
        inputTextField.text=""
        //dismiss(animated: true, completion: nil);
        tableView.reloadData();
    }
    
    @IBAction func btnDelete(_ sender: UIButton)
    {
        self.adventure?.comments.remove(at: sender.tag);
        self.tableView.reloadData();
    }
    
    @IBAction func btnStar1Clicked(_ sender: UIButton)
    {
        btnStar1.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar2.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar3.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar4.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar5.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        AdventureData.adventureInstance.adventureMap![(adventure?.itemId)!]?.rate = 1;
        adventure?.rate = 1;
    }
    
    @IBAction func btnStar2Clicked(_ sender: UIButton)
    {
        btnStar1.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar2.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar3.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar4.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar5.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        AdventureData.adventureInstance.adventureMap![(adventure?.itemId)!]?.rate = 2;
        adventure?.rate = 2;
    }
    
    @IBAction func btnStar3Clicked(_ sender: UIButton)
    {
        btnStar1.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar2.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar3.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar4.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        btnStar5.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        AdventureData.adventureInstance.adventureMap![(adventure?.itemId)!]?.rate = 3;
        adventure?.rate = 3;
    }
    @IBAction func btnStar4Clicked(_ sender: UIButton)
    {
        btnStar1.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar2.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar3.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar4.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar5.setImage(UIImage(named: "star-small-blank"), for: UIControlState.normal);
        AdventureData.adventureInstance.adventureMap![(adventure?.itemId)!]?.rate = 4;
        adventure?.rate = 4;
    }
    @IBAction func btnStar5Clicked(_ sender: UIButton)
    {
        btnStar1.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar2.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar3.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar4.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        btnStar5.setImage(UIImage(named: "star-small-fill"), for: UIControlState.normal);
        AdventureData.adventureInstance.adventureMap![(adventure?.itemId)!]?.rate = 5;
        adventure?.rate = 5;
    }
    
    func saveComment(_ sender:Any)
    {
        //add comment of commentMap with the key as same as adventureMap
        //commentMap[key].addArray(String)
        //dismiss(animated: true, completion: nil);
    }
}
