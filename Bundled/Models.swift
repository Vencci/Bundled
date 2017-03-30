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
    var bundles: [Bundle]?//to change to bundles
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        //to change from "apps" to "bundles"
        if key == "apps" {//to be changed to "bundles"
            
            bundles = [Bundle]()
            for dict in value as! [[String: Any]] {
                let bundle: Bundle? = nil
                bundle?.setValuesForKeys(dict)
                bundles?.append(bundle!)
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
        
        var bannerBundles = [Bundle]()
        
        let firstFeaturedBundle = Bundle(id: NSNumber(value: 123), name: "Fried Feast", category: "Traditional American", imageName: "bundle3", price: NSNumber(value: 0.99))
/*        firstFeaturedBundle.name = "Fried Feast"
        firstFeaturedBundle.imageName = "bundle3"
        firstFeaturedBundle.category = "Traditional American"
        firstFeaturedBundle.price = NSNumber(value: 0.99)
*/        bannerBundles.append(firstFeaturedBundle)
        
        let secondFeaturedBundle = Bundle(id: NSNumber(value: 123), name: "Beef Tacos", category: "Mexican", imageName: "bundle5", price: NSNumber(value: 0.99))
/*        secondFeaturedBundle.name = "Fantastic Dumplings"
        secondFeaturedBundle.imageName = "bundle4"
        secondFeaturedBundle.category = "Asian"
        secondFeaturedBundle.price = NSNumber(value: 9.99)
*/        bannerBundles.append(secondFeaturedBundle)
        
        let thirdFeaturedBundle = Bundle(id: NSNumber(value: 123), name: "Beef Tacos", category: "Mexican", imageName: "bundle5", price: NSNumber(value: 0.99))
/*        thirdFeaturedBundle.name = "Beef Tacos"
        thirdFeaturedBundle.imageName = "bundle5"
        thirdFeaturedBundle.category = "Mexican"
        thirdFeaturedBundle.price = NSNumber(value: 0.99)
*/        bannerBundles.append(thirdFeaturedBundle)
        
        bannerBundlesCatgory.bundles = bannerBundles
        
        
        
        let bestNewBundlesCategory = BundleCategory()
        bestNewBundlesCategory.name = "Best New Bundles"
        
        var bundles = [Bundle]()
        
        // logic
        let oneoneBundle = Bundle(id: NSNumber(value: 123), name: "Simple Made Delicious", category: "Asian Fusion", imageName: "bundle1", price: NSNumber(value: 3.99))
/*        oneoneBundle.name = "Simple Made Delicious"
        oneoneBundle.imageName = "bundle1"
        oneoneBundle.category = "Asian Fusion"
        oneoneBundle.price = NSNumber(value: 3.99)
*/        bundles.append(oneoneBundle)
        
        bestNewBundlesCategory.bundles = bundles
        
        featuredBundlesCategory.append(bestNewBundlesCategory)

        
        let vegetarianBundlesCategory = BundleCategory()
        vegetarianBundlesCategory.name = "Trending Vegetarian Bundles"
        
        var vegetarianBundles = [Bundle]()
        
        let twoooneBundle = Bundle(id: NSNumber(value: 123), name: "Vegetarian Retreat", category: "Vegetarian", imageName: "bundle2", price: NSNumber(value: 0.99))
/*        twoooneBundle.id = NSNumber(value: 123)
        twoooneBundle.name = "Vegetarian Retreat"
        twoooneBundle.imageName = "bundle2"
        twoooneBundle.category = "Vegetarian"
        twoooneBundle.price = NSNumber(value: 0.99)
*/        vegetarianBundles.append(twoooneBundle)
        
        vegetarianBundlesCategory.bundles = vegetarianBundles
        
        featuredBundlesCategory.append(vegetarianBundlesCategory)
        
        featuredBundles.bannerCategory = bannerBundlesCatgory
        
        featuredBundles.bundleCategories = featuredBundlesCategory
        
        
        return [featuredBundles]
    }
}

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


