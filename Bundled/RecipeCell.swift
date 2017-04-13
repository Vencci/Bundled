//
//  RecipeImageCell.swift
//  AppStore
//
//  Created by Wenqi Wang on 06/04/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

var recipeDes = ""

class RecipeCell: BaseCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var recipes: [Recipe] = []
    
    var bundle: Bundles? {
        didSet {
            recipes = (bundle?.recipes)!
        }
    }
    

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        return cv
    }()
    
    
    private let cellId = "cellId"
    
    
    override func setupViews() {
        super.setupViews()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(RecipeImageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RecipeImageCell
        cell.imageView.image = UIImage(named: recipes[indexPath.item].imageName)
        cell.recipeDescription.text = recipes[indexPath.item].details
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height - 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
    private class RecipeImageCell: BaseCell {
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.backgroundColor = UIColor.gray
            return iv
        }()
        
        var recipeDescription: UILabel = {
            
            let iv = UILabel()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.text = ""
            iv.font = UIFont.systemFont(ofSize: 14)
            //iv.backgroundColor = UIColor.gray
            iv.numberOfLines = 6
            
            return iv
        }()
        
        override func setupViews() {
            super.setupViews()
            
            addSubview(imageView)
            addSubview(recipeDescription)
            
            addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
            addConstraintsWithFormat(format: "V:|[v0(200)]-10-[v1]|", views: imageView, recipeDescription)
            addConstraintsWithFormat(format: "H:|[v0]|", views: recipeDescription)
            //addConstraintsWithFormat(format: "V:[v0]|", views: recipeDescription)
            
        }
    }
}
