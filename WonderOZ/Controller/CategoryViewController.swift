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
        
        //let itemSize = 
        
        // Do any additional setup after loading the view.
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
        
        return cell
    }
    

}
