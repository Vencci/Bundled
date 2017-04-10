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

class RecipeStepCell: BaseCell{
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
            titleLabel1.text = prepare.imageName
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
        let imageView = UIView()
        imageView.backgroundColor = UIColor.blue
        //没有下面这行不显示 orz
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let titleLabel1: UILabel = {
        let lable = UILabel()
        lable.backgroundColor = UIColor.yellow
        lable.text = "text"
        return lable
    }()
    
    let bundleImageView: UIImageView = {
        let imageView1 = UIImageView()//this name should be different from the imageView
        imageView1.backgroundColor = UIColor.red
        imageView1.image = UIImage(named: "frenchtoastImage")
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
        lable.text = "slice beef into thin strips."
        lable.numberOfLines = 3
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
        addConstrainsWithFormat(format: "V:|[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, bundleImageView, separatorLine)
        addConstrainsWithFormat(format: "|-16-[v0(44)]", views: bundleImageView)
        addConstrainsWithFormat(format: "V:[v0(44)]", views: titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: bundleImageView, attribute: .right, multiplier: 1, constant: 8))
        
    }
}


