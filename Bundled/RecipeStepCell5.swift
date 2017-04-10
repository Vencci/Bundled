//
//  VideoCell.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 03/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class RecipeStepCell5: BaseCell{
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var prepareC = PreparationController()
    
    var prepare = Preparation(url: beefURL, prepTime: 5, desc: "", imageName: "") {
        didSet{
            titleLabel.text = prepare.desc
        }
    }
    
    var bundle: Bundles? {
        didSet {
        }
    }
    var videoName: String?
    var text : String?
    
    var moviePlayerController = AVPlayerViewController()
    var aPlayer = AVPlayer()
    
    func player(){
    }
    
    let thumbnailImageView: UIView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "cookS")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let bundleImageView: UIImageView = {
        let imageView1 = UIImageView()//this name should be different from the imageView
        imageView1.backgroundColor = UIColor.white
        imageView1.image = UIImage(named: "scrambledImage")
        imageView1.layer.cornerRadius = 22
        imageView1.layer.masksToBounds = true
        return imageView1
    }()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let lable = UILabel()
        lable.backgroundColor = UIColor.white
        lable.text = "CONTINUE cooking – pulling, lifting and folding eggs – until thickened and no visible liquid egg remains. Do not stir constantly. "
        lable.numberOfLines = 5
        return lable
    }()
    
    override func setupViews(){
        backgroundColor = UIColor.white
        addSubview(thumbnailImageView)
        addSubview(separatorLine)
        addSubview(titleLabel)
        addSubview(bundleImageView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorLine]))
        addConstrainsWithFormat(format: "V:|[v0(200)]-8-[v1(44)]-44-[v2(1)]|", views: thumbnailImageView, bundleImageView, separatorLine)
        addConstrainsWithFormat(format: "H:|-16-[v0(44)]", views: bundleImageView)
        addConstrainsWithFormat(format: "V:[v0(130)]", views:titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: bundleImageView, attribute: .right, multiplier: 1, constant: 8))
        
    }
}



