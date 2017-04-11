//
//  TabBarController.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 05/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var bundle: Bundles? {
        didSet {
            //navigationItem.title = bundle?.name
            print(bundle?.name ?? "nothing passed to bundle in tabbar")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(bundle?.name ?? "nothing passed to viewdidload in tabbar")
        let layout = UICollectionViewFlowLayout()
        let preparationController = PreparationController(collectionViewLayout: layout)
        preparationController.bundle = bundle
        
        let shoppingController = ShoppingListController()
        let viewController1 = UINavigationController(rootViewController: shoppingController)
        viewController1.tabBarItem.title = "shopping"
        viewController1.tabBarItem.image = UIImage(named: "shoppingcart29")

        
        let viewController2 = UINavigationController(rootViewController: preparationController)
        viewController2.tabBarItem.title = "preparation"
        viewController2.tabBarItem.image = UIImage(named: "knife29")
        
        
        let recipeController = RecipeController(collectionViewLayout: layout)
        let viewController3 = UINavigationController(rootViewController: recipeController)
        viewController3.tabBarItem.title = "recipe"
        viewController3.tabBarItem.image = UIImage(named: "cookingpot29")

        
        
        
        let testController = AccountView()
        let viewController4 = UINavigationController(rootViewController: testController)
        viewController4.tabBarItem.title = "account"
        viewController4.tabBarItem.image = UIImage(named: "user29")

        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(PreparationController.goBack))
        navigationItem.leftBarButtonItem = backButton
        
        viewControllers = [viewController1,viewController2,viewController3,viewController4]

    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
