//
//  User.swift
//  AppStore
//
//  Created by Wenqi Wang on 09/04/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class User: NSObject {
    var numPeople: Int?
    var numMeals: Int?
    var dietaryRestrictions: [String]?
    init(numPeople: Int, numMeals: Int, dietaryRestrictions: [String]){
        self.numPeople = numPeople
        self.numMeals = numMeals
        self.dietaryRestrictions = dietaryRestrictions
    }
    
    func pickRecipes(user: User) -> [Recipe] {
        var pickedRecipes = [Recipe]()
        var idx = 0
        var restrictedRecipes = [Recipe]()
        
        for recipe in recipeArray {
            for dietRes in user.dietaryRestrictions! {
                if recipe.tag.contains(dietRes.lowercased()) {
                    restrictedRecipes.append(recipe)
                }
                break
            }
        }
        
        if restrictedRecipes.count == 0 {
            restrictedRecipes = recipeArray
        }
        
        repeat {
            let recipe = restrictedRecipes.randomElement()
            var dict = recipe?.ingredients
            for (key, value) in (recipe?.ingredients)!{
                dict?.updateValue((value.0 * user.numPeople!, value.1), forKey: key)
            }
            pickedRecipes.append(recipe!)
            idx = idx + 1
        } while(idx < user.numMeals!)
        return pickedRecipes
    }
}
