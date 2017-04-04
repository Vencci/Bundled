//
//  VideoCell.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 03/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit
class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
    }
    
    
}

class VideoCell: BaseCell{
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
        //        thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        //没有下面这行不显示 orz
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image name")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        print("image added")
        return imageView
    }()
    
    let bundleImageView: UIImageView = {
        let imageView1 = UIImageView()//this name should be different from the imageView
        imageView1.backgroundColor = UIColor.red
        imageView1.image = UIImage(named: "bundle image name")
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
        lable.backgroundColor = UIColor.yellow
        lable.text = "dish introduction and name"
        return lable
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews(){
        backgroundColor = UIColor.white
        addSubview(thumbnailImageView)
        addSubview(separatorLine)
        addSubview(titleLabel)
        addSubview(bundleImageView)
        
        //addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        //addConstrainsWithFormat(format: "H:|-16-[v0(44)]", views: bundleImageView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        //addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2]|", views: thumbnailImageView, bundleImageView, separatorLine)
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView, "v1": separatorLine]))
        
        //addConstrainsWithFormat(format: "H:|[v0]|", views: separatorLine)
        //addConstrainsWithFormat(format: "V:|[v0(1)]|", views: separatorLine)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorLine]))
        addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, bundleImageView, separatorLine)
        addConstrainsWithFormat(format: "|-16-[v0(44)]", views: bundleImageView)
        addConstrainsWithFormat(format: "V:[v0(44)]", views: titleLabel)
        //addConstrainsWithFormat(format: "H:|[v0]|", views: titleLabel	)
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorLine]))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: bundleImageView, attribute: .right, multiplier: 1, constant: 8))
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : titleLabel]))
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(20)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : titleLabel]))
        
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: <#T##String#>, options: <#T##NSLayoutFormatOptions#>, metrics: <#T##[String : Any]?#>, views: <#T##[String : Any]#>))
        
        
    }
}

extension UIView{
    func addConstrainsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


