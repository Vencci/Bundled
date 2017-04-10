//
//  Bundles.swift
//  AppStore
//
//  Created by Wenqi Wang on 09/04/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class Bundles: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: Float?
    var cookTime: Int?
    var prepTime: Int?
    var totalTime: Int?
    var recipes: [Recipe]?
    var preperations: [Preparation]?

    
    func sumPrice(recipes: [Recipe]) -> Float {
        var sum: Float = 0.00
        for recipe in recipes {
            sum = sum + recipe.price
        }
        return sum
    }
    
    func sumPrepTime(recipes: [Recipe]) -> Int {
        var sum = 0
        for recipe in recipes {
            for prep in recipe.preparationArray {
                sum = sum + prep.prepTime
            }
        }
        return sum
    }
    
    func sumCookTime(recipes: [Recipe]) -> Int {
        var sum = 0
        for recipe in recipes {
            sum = sum + recipe.cookTime
        }
        return sum
    }
    
    func allPreperations(bundle: Bundles) -> [Preparation] {
        var preperations = [Preparation]()
        for recipe in bundle.recipes! {
            for preperation in recipe.preparationArray {
                if !preperations.contains(preperation) {
                    preperations.append(preperation)
                }
            }
        }
        return preperations
    }
}
