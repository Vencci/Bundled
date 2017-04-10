//
//  TimePriceCell.swift
//  AppStore
//
//  Created by Wenqi Wang on 06/04/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class TimePriceCell: BaseCell {
    
    var bundle: Bundles? {
        didSet {
            prepTime.text = "\(bundle?.prepTime ?? 0) m"
            cookTime.text = "\(bundle?.cookTime ?? 0) m"
            totalTime.text = "\(bundle?.totalTime ?? 0) m"
            totalPrice.text = "\(bundle?.price ?? 0)"
        }
    }

    
    let timeIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Alarm")
        return iv
    }()
    
    let priceIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Dollar")
        return iv
    }()
    
    let prepTimeLabel: UILabel = {
        let tl = UILabel()
        tl.contentMode = .scaleAspectFill
        tl.text = "Prep"
        tl.textColor = UIColor.darkGray
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.numberOfLines = 1
        return tl
    }()
    
    let prepTime: UILabel = {
        var pt = UILabel()
        pt.contentMode = .scaleAspectFill
        pt.text = ""
        pt.textColor = UIColor.darkGray
        pt.font = UIFont.systemFont(ofSize: 14)
        pt.numberOfLines = 1
        return pt
    }()
    
    let cookTimeLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleAspectFill
        label.text = "Cook"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    let cookTime: UILabel = {
        var pt = UILabel()
        pt.contentMode = .scaleAspectFill
        pt.text = ""
        pt.textColor = UIColor.darkGray
        pt.font = UIFont.systemFont(ofSize: 14)
        pt.numberOfLines = 1
        return pt
    }()
    
    let totalTimeLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleAspectFill
        label.text = "Ready In"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    let totalTime: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleAspectFill
        label.text = ""
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    let totalPrice: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleAspectFill
        label.text = ""
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 1
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(timeIcon)
        addSubview(priceIcon)
        addSubview(prepTimeLabel)
        addSubview(prepTime)
        addSubview(cookTimeLabel)
        addSubview(cookTime)
        addSubview(totalTimeLabel)
        addSubview(totalTime)
        addSubview(totalPrice)

        
        addConstraintsWithFormat(format: "H:|-20-[v0(20)]", views: timeIcon)
        addConstraintsWithFormat(format: "V:|-20-[v0(34)]", views: timeIcon)
        
        addConstraintsWithFormat(format: "H:|-20-[v0(20)]", views: priceIcon)
        addConstraintsWithFormat(format: "V:|-70-[v0(34)]", views: priceIcon)
        
        addConstraintsWithFormat(format: "H:|-70-[v0(50)]", views: prepTimeLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(34)]", views: prepTimeLabel)
        
        addConstraintsWithFormat(format: "H:|-70-[v0(200)]", views: prepTime)
        addConstraintsWithFormat(format: "V:|-28-[v0(34)]", views: prepTime)
        
        addConstraintsWithFormat(format: "H:|-150-[v0(50)]", views: cookTimeLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(34)]", views: cookTimeLabel)
        
        addConstraintsWithFormat(format: "H:|-150-[v0(200)]", views: cookTime)
        addConstraintsWithFormat(format: "V:|-28-[v0(34)]", views: cookTime)
        
        addConstraintsWithFormat(format: "H:|-220-[v0(100)]", views: totalTimeLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(34)]", views: totalTimeLabel)
        
        addConstraintsWithFormat(format: "H:|-220-[v0(200)]", views: totalTime)
        addConstraintsWithFormat(format: "V:|-28-[v0(34)]", views: totalTime)
        
        addConstraintsWithFormat(format: "H:|-70-[v0(100)]", views: totalPrice)
        addConstraintsWithFormat(format: "V:|-70-[v0(34)]", views: totalPrice)
        
        backgroundColor = UIColor.clear
        
    }
}




