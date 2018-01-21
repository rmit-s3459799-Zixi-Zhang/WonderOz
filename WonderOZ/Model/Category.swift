//
//  Category.swift
//  WonderOZ
//
//  Created by Zhangzixi on 2018/1/21.
//  Copyright © 2018年 iOSWorld. All rights reserved.
//

import Foundation

import UIKit

class category {
    
    var title: String;
    var NumOfAdv: Int;
    var Cate : Category;
    var cateImage: UIImage;
    
    init(_ title:String, _ NumOfAdv:Int, _ Cate: Category, _ cateImage: UIImage) {
        self.title = title;
        self.NumOfAdv = NumOfAdv;
        self.Cate = Cate;
        self.cateImage = cateImage;
    }
    
    
}
