//
//  CategoryViewController.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/21.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var categoryList:[category] = CategoryData.cateInstance.getCategoryList();
    //let Array:[String] = ["camping", "park1"]
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let itemsize = myCollectionView.frame.size.width/2 - 2;
        print(itemsize);
        
        let layout = UICollectionViewFlowLayout();
        //layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize);
        layout.minimumInteritemSpacing = 2;
        layout.minimumLineSpacing = 2;
        myCollectionView.setCollectionViewLayout(layout, animated: true)
        myCollectionView.reloadData()*/
        
        //myCollectionView.collectionViewLayout = layout;
        
       
        //layout.itemSize = CGSize(width: itemSize)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsize = myCollectionView.frame.size.width/2 - 2;
        print(itemsize);
        
        let layout = UICollectionViewFlowLayout();
        //layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemsize, height: itemsize);
        layout.minimumInteritemSpacing = 2;
        layout.minimumLineSpacing = 2;
        myCollectionView.setCollectionViewLayout(layout, animated: true)
        myCollectionView.reloadData()
        
        //myCollectionView.collectionViewLayout = layout;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let adventure = self.categoryList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        
        cell.imageView.image = adventure.cateImage;
        
        cell.EventTitle.text = adventure.title;
        cell.NumberOfEvent.text = String(adventure.NumOfAdv) + " Adventures";
        
        //cell.imageView.image = UIImage(named: Array[indexPath.row] + ".JPG")
        /*if indexPath.row == 0
        {
            print("Test 1")
            
        }
        if indexPath.row == 1 {
            print("gozmike on @producthunt")
            
        }
        if indexPath.row == 2 {
            print("Test 3")
            
        }*/
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let cag = categoryList[indexPath.item]
        self.performSegue(withIdentifier: "CateToAdvSegue", sender: cag.Cate)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {

        if segue.identifier == "CateToAdvSegue"
        {
            let vc = segue.destination as! AdvTableViewController
           
            vc.seleted_Index = sender as? Category
                
                //var cell = self.collectionView.cellForItem(at: indexPaths)
                //vc.seleted_Index =
                //var temp : [Int] = index;
                //print(index)
                
                /*let ind : Int = 0;
                switch ind{
                case Category.camping:
                    vc.seleted_Index = Category.camping;
                    break;
                    
                default:
                    break;
                }*/
                
          
            
        }
        
        
    }

}
