//
//  ShoppingViewController.swift
//  Bundled
//
//  Created by Wenqi Wang on 12/02/2017.
//  Copyright © 2017 si zhang. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //var view: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //var view: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCell", for: indexPath) as! ShoppingListCell
        let row = indexPath.row
        // foods = instance.ingredients!
        let food = foods[row]
        cell.name.text = food.title
        cell.number.text = food.content
        if food.completed{
            
            cell.accessoryType = .checkmark
            
        }
            
        else{
            
            cell.accessoryType = .none
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        var tappedItem:  Ingredients = self.foods[indexPath.row] as Ingredients
        
        tappedItem.completed = !tappedItem.completed
        
        tableView.reloadData()
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
