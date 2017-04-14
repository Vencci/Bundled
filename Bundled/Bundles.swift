//
//  Bundles.swift
//  AppStore
//
//  Created by Wenqi Wang on 09/04/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class Bundles: NSObject, NSCoding {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("BundlesInfoFile")
    
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
    
    init(id: NSNumber?, name: String?, category: String?, imageName: String?, price: Float?, cookTime: Int?, prepTime: Int?, totalTime: Int?, recipes: [Recipe]?, preperations: [Preparation]?, ingredients: [String: (Float, String)]?) {
        self.id = id
        self.name = name
        self.category = category
        self.imageName = imageName
        self.price = price
        self.cookTime = cookTime
        self.prepTime = prepTime
        self.totalTime = totalTime
        self.recipes = recipes
        self.preperations = preperations
        self.ingredients = ingredients
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as? NSNumber
        let name = aDecoder.decodeObject(forKey: "name") as? String
        let category = aDecoder.decodeObject(forKey: "category") as? String
        let imageName = aDecoder.decodeObject(forKey: "imageName") as? String
        let price = Float(aDecoder.decodeFloat(forKey: "price"))
        let cookTime = Int(aDecoder.decodeCInt(forKey: "cookTime"))
        let prepTime = Int(aDecoder.decodeCInt(forKey: "prepTime"))
        let totalTime = Int(aDecoder.decodeCInt(forKey: "totalTime"))
        let recipes = aDecoder.decodeObject(forKey: "recipes") as? [Recipe]
        let preperations = aDecoder.decodeObject(forKey: "preperations") as? [Preparation]
        let ingredients = aDecoder.decodeObject(forKey: "ingredients") as? [String:(Float, String)]
        self.init(id: id, name: name, category: category, imageName: imageName, price: price, cookTime: cookTime, prepTime: prepTime, totalTime: totalTime, recipes: recipes, preperations: preperations, ingredients: ingredients)

    }
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(category, forKey: "category")
        aCoder.encode(imageName, forKey: "imageName")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(cookTime, forKey: "cookTime")
        aCoder.encode(prepTime, forKey: "prepTime")
        aCoder.encode(totalTime, forKey: "totalTime")
        aCoder.encode(recipes, forKey: "recipes")
        aCoder.encode(preperations, forKey: "preperations")
        aCoder.encode(ingredients, forKey: "ingredients")
        
    }
    
    static func saveBundleInfo(_ bundle: Bundles) -> Bool {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(bundle, toFile: Bundles.ArchiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save info")
            return false
        } else {
            print("Info saved")
            return true
        }
    }
    
    static func loadBundleInfo() -> Bundles? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Bundles.ArchiveURL.path) as? Bundles
    }
    
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


