//
//  Recipe.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 06/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    var id: NSNumber
    var name: String
    var category: String
    var preparationArray: [Preparation]
    var imageName: String
    var price:Float
    var cookTime: Int
    var tag: [String]
    var ingredients: [String:(Float, String)]
    var steps: [(String, String)]
    var details: String
    
    init(id: NSNumber, name: String, category: String, preparationArray: [Preparation], imageName: String, price: Float, cookTime: Int, tag: [String], ingredients: [String:(Float, String)],steps:[(String, String)], details: String) {
        self.id = id
        self.name = name
        self.category = category
        self.preparationArray = preparationArray
        self.imageName = imageName
        self.price = price
        self.cookTime = cookTime
        self.tag = tag
        self.ingredients = ingredients
        self.steps = steps
        self.details = details
    }
}


