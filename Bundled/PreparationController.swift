//
//  PreparationController.swift
//  Bundled
//
//  Created by Wenqi Wang on 04/04/2017.
//  Copyright © 2017 si zhang. All rights reserved.
//

import UIKit

class PreparationController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title = "Preparation"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLable = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLable.text = "Preparation"
        titleLable.textColor = UIColor.white
        navigationItem.titleView = titleLable
        titleLable.font = UIFont.systemFont(ofSize: 20)
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(40, 0, 0, 0)
        setupMenuBar()
        //setupNavBarButtons()
}

/*    func setupNavBarButtons(){
 let searchImage = UIImage(named: "searchIcon")?.withRenderingMode(.alwaysOriginal)
 let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
 navigationItem.rightBarButtonItem = [searchBarButtonItem]
 
 }
 
 func handleSearch(){
 print(123)
 }
 */

let menuBar : MenuBar = {
    let mb = MenuBar()
    return mb
    }()


