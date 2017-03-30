//
//  StepCell.swift
//  prepare and recipe
//
//  Created by Wenqi Wang on 29/03/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class StepCell: UICollectionViewCell {
    var bundle: Bundle? {
        didSet {
            if let name = bundle?.name{
                nameLabel.text = name
                
                let rect = NSString(string:name).boundingRect(with: CGSize(width: frame.width,height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14)], context: nil)
                
                if rect.height > 20 {
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
                } else {
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 40, width: frame.width, height: 20)
                }
                
                nameLabel.frame = CGRect(x: 0, y: frame.width + 5, width: frame.width, height: 40)
                nameLabel.sizeToFit()
                
            }
            
            categoryLabel.text = bundle?.category
            
            if let price = bundle?.price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
            
            if let imageName = bundle?.imageName {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = { () -> UIImageView in
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
        
    }()
    
    let nameLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "Simple Made Delicious"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "Asian Fusion"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    let priceLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "$9.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    
    
    func setupViews() {
        
        imageView.backgroundColor = UIColor.darkGray
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
    }

}
