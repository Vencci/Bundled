//
//  Models.swift
//  AppStore
//
//  Created by Wenqi Wang on 25/03/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class FeaturedBundles: NSObject {
    
    var bannerCategory: BundleCategory?
    var bundleCategories: [BundleCategory]?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "categories" {
            bundleCategories = [BundleCategory]()
            
            for dict in value as! [[String: AnyObject]] {
                let bundleCategory = BundleCategory()
                bundleCategory.setValuesForKeys(dict)
                bundleCategories?.append(bundleCategory)
            }
            
        } else if key == "bannerCategory" {
            bannerCategory = BundleCategory()
            bannerCategory?.setValuesForKeys(value as! [String: AnyObject])
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
}

class BundleCategory: NSObject{
    var name: String?
    var bundles: [Bundles]?//to change to bundles
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        //to change from "apps" to "bundles"
        if key == "apps" {//to be changed to "bundles"
            
            bundles = [Bundles]()
            for dict in value as! [[String: Any]] {
                let bundle = Bundles()
                bundle.setValuesForKeys(dict)
                bundles?.append(bundle)
            }
            
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func fetchFeaturedBundles(completionHandler: @escaping (FeaturedBundles) -> ()) {
        let urlString = "http://www.statsallday.com/appstore/featured"
        
        URLSession.shared.dataTask(with: URL(string:urlString)!) { (data,response,error) in
            
            if error != nil {
                print(error!)
                return
            }
            do {
                let json = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers))
                
                let featuredBundles = FeaturedBundles()
                featuredBundles.setValuesForKeys(json as! [String: Any])
                  
                
                DispatchQueue.main.async(execute: {
                    completionHandler(featuredBundles)
                })
                
            } catch let err {
                print(err)
            }
            
        }.resume()
    }
    
    static func sampleBundleCategories() -> [FeaturedBundles] {
        
        let featuredBundles = FeaturedBundles()
        let bannerBundlesCatgory = BundleCategory()
        var featuredBundlesCategory = [BundleCategory]()
        
        var bannerBundles = [Bundles]()
        
        recipeArray.append(frenchToastRecipe)
        recipeArray.append(scrambledEggsRecipe)
        recipeArray.append(flatPizzaRecipe)
        recipeArray.append(asianBeefRecipe)
        recipeArray.append(balsamicGlazedCarrots)
        recipeArray.append(greenBeanandPotatoSalad)
        recipeArray.append(mangoSalsaonTilapiaFillets)
        recipeArray.append(sesameGreenBeans)
        recipeArray.append(cedarPlankedSalmon)
        recipeArray.append(broccoli)
        
        let firstFeaturedBundle = Bundles()
        firstFeaturedBundle.name = "Fried Feast"
        firstFeaturedBundle.imageName = "bundle3"
        firstFeaturedBundle.category = "Traditional American"
        firstFeaturedBundle.recipes = myUser.pickRecipes(user: myUser)
        //print(user?.numMeals ?? "not passed in")
        firstFeaturedBundle.price = firstFeaturedBundle.sumPrice(recipes: firstFeaturedBundle.recipes!)
        firstFeaturedBundle.prepTime = firstFeaturedBundle.sumPrepTime(recipes: firstFeaturedBundle.recipes!)
        firstFeaturedBundle.cookTime = firstFeaturedBundle.sumCookTime(recipes: firstFeaturedBundle.recipes!)
        firstFeaturedBundle.totalTime = firstFeaturedBundle.prepTime! + firstFeaturedBundle.cookTime!
        firstFeaturedBundle.preperations = firstFeaturedBundle.allPreperations(bundle: firstFeaturedBundle)

        bannerBundles.append(firstFeaturedBundle)
        
        let secondFeaturedBundle = Bundles()
        secondFeaturedBundle.name = "Fantastic Dumplings"
        secondFeaturedBundle.imageName = "bundle4"
        secondFeaturedBundle.category = "Asian"
        secondFeaturedBundle.recipes = myUser.pickRecipes(user: myUser)
        secondFeaturedBundle.price = secondFeaturedBundle.sumPrice(recipes: secondFeaturedBundle.recipes!)
        secondFeaturedBundle.prepTime = secondFeaturedBundle.sumPrepTime(recipes: secondFeaturedBundle.recipes!)
        secondFeaturedBundle.cookTime = secondFeaturedBundle.sumCookTime(recipes: secondFeaturedBundle.recipes!)
        secondFeaturedBundle.totalTime = secondFeaturedBundle.prepTime! + secondFeaturedBundle.cookTime!
        secondFeaturedBundle.preperations = secondFeaturedBundle.allPreperations(bundle: secondFeaturedBundle)

        bannerBundles.append(secondFeaturedBundle)
        
        let thirdFeaturedBundle = Bundles()
        thirdFeaturedBundle.name = "Beef Tacos"
        thirdFeaturedBundle.imageName = "bundle5"
        thirdFeaturedBundle.category = "Mexican"
        thirdFeaturedBundle.recipes = myUser.pickRecipes(user: myUser)
        thirdFeaturedBundle.price = thirdFeaturedBundle.sumPrice(recipes: thirdFeaturedBundle.recipes!)
        thirdFeaturedBundle.prepTime = thirdFeaturedBundle.sumPrepTime(recipes: thirdFeaturedBundle.recipes!)
        thirdFeaturedBundle.cookTime = thirdFeaturedBundle.sumCookTime(recipes: thirdFeaturedBundle.recipes!)
        thirdFeaturedBundle.totalTime = thirdFeaturedBundle.prepTime! + thirdFeaturedBundle.cookTime!
        thirdFeaturedBundle.preperations = thirdFeaturedBundle.allPreperations(bundle: thirdFeaturedBundle)

        bannerBundles.append(thirdFeaturedBundle)
        
        bannerBundlesCatgory.bundles = bannerBundles
        
        
        
        let bestNewBundlesCategory = BundleCategory()
        bestNewBundlesCategory.name = "Best New Bundles"
        
        var bundles = [Bundles]()
        
        // logic
        let oneoneBundle = Bundles()
        oneoneBundle.name = "Simple Made Delicious"
        oneoneBundle.imageName = "bundle1"
        oneoneBundle.category = "Asian Fusion"
        oneoneBundle.recipes = myUser.pickRecipes(user: myUser) //改成random函数产生的
        //oneoneBundle
        oneoneBundle.price = oneoneBundle.sumPrice(recipes: oneoneBundle.recipes!)
        oneoneBundle.prepTime = oneoneBundle.sumPrepTime(recipes: oneoneBundle.recipes!)
        oneoneBundle.cookTime = oneoneBundle.sumCookTime(recipes: oneoneBundle.recipes!)
        oneoneBundle.totalTime = oneoneBundle.prepTime! + oneoneBundle.cookTime!
        oneoneBundle.preperations = oneoneBundle.allPreperations(bundle: oneoneBundle)
        bundles.append(oneoneBundle)

        let onetwoBundle = Bundles()
        onetwoBundle.name = "Asian Blast"
        onetwoBundle.imageName = "bundle3"
        onetwoBundle.category = "Asian Fusion"
        onetwoBundle.recipes = myUser.pickRecipes(user: myUser)
        onetwoBundle.price = onetwoBundle.sumPrice(recipes: onetwoBundle.recipes!)
        onetwoBundle.prepTime = onetwoBundle.sumPrepTime(recipes: onetwoBundle.recipes!)
        onetwoBundle.cookTime = onetwoBundle.sumCookTime(recipes: onetwoBundle.recipes!)
        onetwoBundle.totalTime = onetwoBundle.prepTime! + onetwoBundle.cookTime!
        onetwoBundle.preperations = onetwoBundle.allPreperations(bundle: onetwoBundle)

        bundles.append(onetwoBundle)
        
        let onethreeBundle = Bundles()
        onethreeBundle.name = "Tokyo Summit"
        onethreeBundle.imageName = "bundle4"
        onethreeBundle.category = "Asian Fusion"
        onethreeBundle.recipes = myUser.pickRecipes(user: myUser)
        onethreeBundle.price = onethreeBundle.sumPrice(recipes: onethreeBundle.recipes!)
        onethreeBundle.prepTime = onethreeBundle.sumPrepTime(recipes: onethreeBundle.recipes!)
        onethreeBundle.cookTime = onethreeBundle.sumCookTime(recipes: onethreeBundle.recipes!)
        onethreeBundle.totalTime = onethreeBundle.prepTime! + onethreeBundle.cookTime!
        onethreeBundle.preperations = onethreeBundle.allPreperations(bundle: onethreeBundle)
        bundles.append(onethreeBundle)

        bestNewBundlesCategory.bundles = bundles
        
        
        featuredBundlesCategory.append(bestNewBundlesCategory)

        
        let vegetarianBundlesCategory = BundleCategory()
        vegetarianBundlesCategory.name = "Trending Vegetarian Bundles"
        
        var vegetarianBundles = [Bundles]()
        
        let twoooneBundle = Bundles()
        twoooneBundle.name = "Vegetarian Retreat"
        twoooneBundle.imageName = "bundle2"
        twoooneBundle.category = "Vegetarian"
        twoooneBundle.recipes = myUser.pickRecipes(user: myUser)
        twoooneBundle.price = twoooneBundle.sumPrice(recipes: twoooneBundle.recipes!)
        twoooneBundle.prepTime = twoooneBundle.sumPrepTime(recipes: twoooneBundle.recipes!)
        twoooneBundle.cookTime = twoooneBundle.sumCookTime(recipes: twoooneBundle.recipes!)
        twoooneBundle.totalTime = twoooneBundle.prepTime! + twoooneBundle.cookTime!
        onethreeBundle.preperations = onethreeBundle.allPreperations(bundle: twoooneBundle)

        vegetarianBundles.append(twoooneBundle)
        
        vegetarianBundlesCategory.bundles = vegetarianBundles
        
        featuredBundlesCategory.append(vegetarianBundlesCategory)
        
        featuredBundles.bannerCategory = bannerBundlesCatgory
        
        featuredBundles.bundleCategories = featuredBundlesCategory
        
        
        return [featuredBundles]
        
    }
}

extension Array {
    func randomElement() -> Iterator.Element? {
        return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
    }
}
