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
    var ingredients: [String:(Float, String)]?

    
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
    
    func allIngredients(bundle: Bundles) -> [String:(Float, String)] {
        var ingredients = [String: (Float, String)]()
        for recipe in bundle.recipes! {
            for item in recipe.ingredients{
                if ingredients[item.key] == nil {
                    ingredients[item.key] = item.value
                }
                else {
                    ingredients[item.key]?.0 += item.value.0
                }
            }
        }
        return ingredients
    }
}


