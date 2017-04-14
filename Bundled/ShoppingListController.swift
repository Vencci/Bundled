//
//  ViewController.swift
//  TableViewTest
//
//  Created by si zhang on 17/4/5.
//  Copyright © 2017年 si zhang. All rights reserved.
//

import UIKit

class ShoppingListController: UITableViewController {
    
    var bundle: Bundles? {
        didSet{
            for item in (bundle?.ingredients)!{
                ingredientsArray.append(item.key.lowercased())
                quantitiesArray.append(item.value)
            }
        }
    }
    
    var ingredientsArray = [String]()
    var quantitiesArray = [(Float, String)]()
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let title: UILabel = UILabel.init(frame: CGRect(x:0, y:0, width:tableView.bounds.width, height:80))
        title.text = "Shopping List"
        title.textColor = UIColor(red: 77.0/255.0, green: 98.0/255.0, blue: 130.0/255.0, alpha: 1.0)
        title.backgroundColor = UIColor(red: 225.0/255.0, green: 243.0/255.0, blue: 251.0/255.0, alpha: 1.0)
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textAlignment = NSTextAlignment.center
        tableView.tableHeaderView = title
    }
    // MARK: table view pop up effect
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (bundle?.ingredients!.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "myIdentifier")
        
        let foodItem = ingredientsArray[indexPath.row]
        let itemQuantity = "\(quantitiesArray[indexPath.row].0) " + quantitiesArray[indexPath.row].1
        
        cell.textLabel?.text = itemQuantity + " of " + foodItem
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
}
