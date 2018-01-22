//
//  FavoriteViewController.swift
//  WonderOZ
//
//  Created by Jason-Zhuang on 21/1/18.
//  Copyright © 2018 iOSWorld. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FavoriteViewController: UICollectionViewController
{

    //var myFavoriteCategory = AdventureData.adventureInstance.getFavouriteCategories();
    var myFavoriteCategory = [CategoryClass]()
    
    struct StoryBoard
    {
        static let favoriteCell = "favoriteCell"
        static let favoriteHeaderView   = "favoriteHeaderView"
        static let showDetailSegue = "showFavoriteDetial"
        static let leftAndRightPaddings: CGFloat = 2.0
        static let numberOfItemsPerRow:CGFloat = 2.0
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let myCollectionViewWith = collectionView?.frame.width;
        // let myItemWidth = (myCollectionViewWith! - StoryBoard.leftAndRightPaddings)/StoryBoard.numberOfItemsPerRow;
        //let layout = collectionViewLayout as! UICollectionViewFlowLayout
        //layout.itemSize = CGSize(width: myItemWidth, height: myItemWidth)
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.myFavoriteCategory = AdventureData.adventureInstance.getFavouriteCategories();
        collectionView?.reloadData();
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return self.myFavoriteCategory.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.myFavoriteCategory[section].adventureList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier:StoryBoard.favoriteCell, for: indexPath ) as! FavoriteCellectionViewCell
        
        let categoryClass = myFavoriteCategory[indexPath.section];
        
        let adventureList = categoryClass.adventureList
        
        let adventure  = adventureList[indexPath.item]
       
        //==========
        cell.adventureTitle.text  = adventure.title
            + "\n" + adventure.address
            + "\n" + "\(String(adventure.distance))( km away)";
        //==========
        cell.adventureImage.image = adventure.itemImages[0]
        
        //==========
        cell.btnFavorite.tag = indexPath.item;
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
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryBoard.favoriteHeaderView, for: indexPath) as! FavoriteHeaderView
        
        let category = myFavoriteCategory[indexPath.section]
        
        headerView.categoryTitle.text = category.categoryName
        
        return headerView;
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let category = self.myFavoriteCategory[indexPath.section]
        let adventure = category.adventureList[indexPath.item]
        self.performSegue(withIdentifier: StoryBoard.showDetailSegue, sender: adventure)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == StoryBoard.showDetailSegue
        {
            let detailViewController = segue.destination as! AdvDetailViewController
            detailViewController.adventure = sender as? Adventure
        }
    }
}
