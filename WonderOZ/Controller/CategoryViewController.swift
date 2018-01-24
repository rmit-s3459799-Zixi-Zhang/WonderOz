//
//  CategoryViewController.swift
//  WonderOZ
//
//  Created by Jason-Zhuang on 22/1/18.
//  Copyright © 2018 iOSWorld. All rights reserved.
//

import UIKit

private let reuseIdentifier = "categoryCell"

class CategoryViewController: UICollectionViewController
{
    //datasouce [CategoryClass]
    var myCategories = AdventureData.adventureInstance.adventureCategories;
    private let leftAndRighPadding:CGFloat = 30.0
    private let numberOfItemsPerRow:CGFloat = 2.0
    private let heightAjustment:CGFloat = 30.0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let width = (collectionView!.frame.width - leftAndRighPadding )/numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize.init(width: width, height: width)
    }

    override func viewDidAppear(_ animated: Bool)
    {
        myCategories = AdventureData.adventureInstance.initAdventureCategories();
        collectionView?.reloadData();
    }
    
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.myCategories!.count;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryViewCell
        let cate = myCategories![indexPath.item]
        cell.categoryImage.image = UIImage(named: cate.categoryName)
        cell.categoryName.text = cate.categoryName
        cell.numberOfItems.text = String(cate.adventureList.count) + " adventures"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let myCate:CategoryClass = myCategories![indexPath.item]
        
        let advList = AdventureData.adventureInstance.getAdventuresByCategory(category: myCate.categoryIndex);
        if  advList.count == 0
        {
            popOverWindow(msg: "This is no Adventure!")
            return
        }
        
        
        self.performSegue(withIdentifier: "categoryToList", sender: myCate.categoryIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "categoryToList"
        {
            let controller = segue.destination as! AdvTableViewController
            controller.myCategory = sender as? Category
        }
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
