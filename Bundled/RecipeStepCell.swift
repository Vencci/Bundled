//
//  RecipeStepCell.swift
//  AppStore
//
//  Created by Wenqi Wang on 10/04/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class RecipeStepCell: BaseCell {
    
    var recipe: Recipe? {
        didSet {
            bundleImageView.image = UIImage(named: (recipe?.imageName)!)
        }
    }
    
    
    var recipeStep : (String,String)? {
        didSet {
            titleLabel.text = self.recipeStep?.1
            thumbnailImageView.image = UIImage(named: (self.recipeStep?.0)!)
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "heatF")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let bundleImageView: UIImageView = {
        let imageView = UIImageView()//this name should be different from the imageView
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "frenchtoastImage")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.text = ""
        label.numberOfLines = 8
        return label
    }()
    
    override func setupViews(){
        backgroundColor = UIColor.white
        addSubview(thumbnailImageView)
        addSubview(separatorLine)
        addSubview(titleLabel)
        addSubview(bundleImageView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorLine]))
        addConstraintsWithFormat(format: "V:|[v0(200)]-8-[v1(44)]-44-[v2(1)]|", views: thumbnailImageView, bundleImageView, separatorLine)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: bundleImageView)
        addConstraintsWithFormat(format: "V:[v0(130)]", views:titleLabel)
        
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: bundleImageView, attribute: .right, multiplier: 1, constant: 8))
        
    }
}
