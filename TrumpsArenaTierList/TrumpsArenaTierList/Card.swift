//
//  Card.swift
//  TrumpsArenaTierList
//
//  Created by 林东杰 on 3/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//


import Foundation


enum CardRating: Int {
    case Best = 0
    case Excellent = 1
    case Good = 2
    case Average = 3
    case Poor = 4
    case Terrible = 5
}

enum CardCategory: Int {
    case Durid = 0
    case Mage = 1
    case Paladin = 2
    case Priest = 3
    case Rogue = 4
    case Shaman = 5
    case Warrior = 6
    case Hunter = 7
    case Warlock = 8
    case Common = 9
}


/*  卡片类  */
class Card{
    /// 卡片编码，也做排序用
    var code: Int
    /// 卡片名称
    var name: String
    /// 卡片分类：九大职业+中立 0-10,-1
    var category: String
    /// 卡片评分 0-5六个级别，0为最好，6为最差
    var rating: String
    /// 卡片描述
    var describe: String
    /// 卡片Url，从官方网站上读取
    var url: String
    
    init(code: Int, name: String, category: String, rating: String, describe: String, url: String ) {
        self.code = code
        self.name = name
        self.category = category
        self.rating = rating
        self.describe = describe
        self.url = url
    }
    
}