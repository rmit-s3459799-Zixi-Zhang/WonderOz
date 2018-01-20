//
//  AdvTableViewController.swift
//  WonderOZ
//
//  Created by Jason-Zhuang on 20/1/18.
//  Copyright © 2018 iOSWorld. All rights reserved.
//

import UIKit

class AdvTableViewController: UITableViewController
{
    var adventureLst:[Adventure] = AdventureData.adventureInstance.getAdventuresList()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //self.tableView.reloadData();
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool)
    {
        
        tableView.reloadData();
        
    }
    
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let listCount:Int = self.adventureLst.count;
        return listCount;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Configure the cell...
        let adventure = self.adventureLst[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "adventureViewCell", for: indexPath) as! AdvTableViewCell
        cell.selectionStyle = .none;
        //==========
        cell.adventureTitle.text  = adventure.title
            + "\n" + adventure.address
            + "\n" + "\(String(adventure.distance))( km away)"; 
        //==========
        cell.adventureImage.image = adventure.itemImages[0]
        
        //==========
        cell.btnFavorite.tag = indexPath.row;
        if (adventure.favourite == false)
        {
            cell.btnFavorite.setImage(UIImage(named: "favorite-small-blank"), for: UIControlState.normal)
        }else
        {
            cell.btnFavorite.setImage(UIImage(named: "favorite-small-fill"), for: UIControlState.normal)
        }
        //=========
        switch adventure.rate
        {
        case 0:
            cell.star1.image = UIImage(named: "star-small-blank")
            cell.star2.image = UIImage(named: "star-small-blank")
            cell.star3.image = UIImage(named: "star-small-blank")
            cell.star4.image = UIImage(named: "star-small-blank")
            cell.star5.image = UIImage(named: "star-small-blank")
        case 1:
            cell.star1.image = UIImage(named: "star-small-fill")
            cell.star2.image = UIImage(named: "star-small-blank")
            cell.star3.image = UIImage(named: "star-small-blank")
            cell.star4.image = UIImage(named: "star-small-blank")
            cell.star5.image = UIImage(named: "star-small-blank")
        case 2:
            cell.star1.image = UIImage(named: "star-small-fill")
            cell.star2.image = UIImage(named: "star-small-fill")
            cell.star3.image = UIImage(named: "star-small-blank")
            cell.star4.image = UIImage(named: "star-small-blank")
            cell.star5.image = UIImage(named: "star-small-blank")
        case 3:
            cell.star1.image = UIImage(named: "star-small-fill")
            cell.star2.image = UIImage(named: "star-small-fill")
            cell.star3.image = UIImage(named: "star-small-fill")
            cell.star4.image = UIImage(named: "star-small-blank")
            cell.star5.image = UIImage(named: "star-small-blank")
        case 4:
            cell.star1.image = UIImage(named: "star-small-fill")
            cell.star2.image = UIImage(named: "star-small-fill")
            cell.star3.image = UIImage(named: "star-small-fill")
            cell.star4.image = UIImage(named: "star-small-fill")
            cell.star5.image = UIImage(named: "star-small-blank")
        case 5:
            cell.star1.image = UIImage(named: "star-small-fill")
            cell.star2.image = UIImage(named: "star-small-fill")
            cell.star3.image = UIImage(named: "star-small-fill")
            cell.star4.image = UIImage(named: "star-small-fill")
            cell.star5.image = UIImage(named: "star-small-fill")
        default:
            break
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200;
    }
    
    @IBAction func favoriteClicked(_ sender: UIButton)
    {
        let itemId = adventureLst[sender.tag].itemId
        let adventure = AdventureData.adventureInstance.adventureMap![itemId]
        if (adventure?.favourite == true)
        {
            adventure?.favourite = false
        }else
        {
            adventure?.favourite = true
        }
        self.tableView.reloadData();
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier
        {
            switch identifier {
            case "showDetail":
                let adventureDVC = segue.destination as! AdvDetailViewController
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
                {
                    adventureDVC.adventure = adventureLst[indexPath.row]
                }
            default:
                break
            }
            
        }
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
 

}
