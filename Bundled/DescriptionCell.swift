//
//  DescriptionCell.swift
//  AppStore
//
//  Created by Wenqi Wang on 06/04/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

var descriptionLabel = DescriptionCell()

import UIKit

class DescriptionCell: BaseCell {

    
    var recipes = [Recipe]()
    
    var recipeDescription: UILabel = {
        let iv = UILabel()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.text = ""
        iv.font = UIFont.systemFont(ofSize: 14)
        //iv.backgroundColor = UIColor.gray
        iv.numberOfLines = 5
        return iv
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        recipeDescription.text = recipeDes
        
        addSubview(recipeDescription)
        
        
        backgroundColor = UIColor.clear
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: recipeDescription)
        addConstraintsWithFormat(format: "V:|-[v0(100)]", views: recipeDescription)
        
    }
}
