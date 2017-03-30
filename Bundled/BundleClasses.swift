//
//  bundle class and subclasses.swift
//  Bundled
//
//  Created by Wenqi Wang on 29/03/2017.
//  Copyright © 2017 si zhang. All rights reserved.
//

import Foundation
import UIKit


class Recipe: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    override var description: String{
        return "here is your recipe"
    }
}

class Preparation: NSObject{
    var id : NSNumber?
    var name : NSString?
    var steps : [[UIImage : NSString]]?
    //var pic : UIImage?
    override var description: String{
        return "the preparation is easy"
    }
}


class Bundle: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    /*    var shoppingList = [[String: String]]()
     var dishes = [Dish]()
     var recipe: Recipe?
     var preparation: Preparation?
     */
    
    init(id: NSNumber, name: String, category: String, imageName: String, price: NSNumber){
        self.id = id
        self.name = name
        self.category = category
        self.imageName = imageName
        self.price = price
    }
    override var description: String{
        return "this bundle is great"
    }
    
    func getName()->String{
        return name!
    }
    func setName(bName: String){
        self.name = bName
    }
    
}

class Dish: NSObject{
    var id : NSNumber?
    var name : NSString?
    var prepSteps : Preparation?
    var catagory : String?
    var image : UIImage?
    var shoppingList = [[String: String]]()
    var recipe: Recipe?
    var preparation: Preparation?
    override var description: String{
        return "this is a great dish"
    }
}
