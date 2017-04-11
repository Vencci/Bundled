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


class VideoCell: BaseCell{
    
    var bundle: Bundles? {
        didSet {
            bundleImageView.image = UIImage(named: (bundle?.imageName)!)
        }
    }
    
    var prepare: Preparation? {
        didSet {
            titleLabel.text = prepare?.desc
            player.player = AVPlayer(url: (prepare?.url)!)
            
        }
    }
    
    let thumbnailImageView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = UIColor.blue
        //没有下面这行不显示 orz
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let bundleImageView: UIImageView = {
        let imageView1 = UIImageView()//this name should be different from the imageView
        imageView1.backgroundColor = UIColor.red
        imageView1.image = UIImage(named: "image name")
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
    
    
    let player: AVPlayerViewController = {
        var moviePlayerController = AVPlayerViewController()
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        var aPlayer = AVPlayer(url: videoURL!)
        moviePlayerController.player = aPlayer
        //moviePlayerController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width * 9 / 16)
        moviePlayerController.videoGravity = AVLayerVideoGravityResizeAspect
        moviePlayerController.view.sizeToFit()
        moviePlayerController.showsPlaybackControls = true
        moviePlayerController.didMove(toParentViewController: PreparationController())
        moviePlayerController.showsPlaybackControls = true
        return moviePlayerController
    }()
    
    
    override func setupViews(){
        backgroundColor = UIColor.white
        
        self.contentView.addSubview(player.view)
        addSubview(separatorLine)
        addSubview(titleLabel)
        addSubview(bundleImageView)
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : player.view]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorLine]))
        addConstraintsWithFormat(format: "V:|[v0]-8-[v1(44)]-16-[v2(1)]|", views: player.view, bundleImageView, separatorLine)
        addConstraintsWithFormat(format: "|-16-[v0(44)]", views: bundleImageView)
        addConstraintsWithFormat(format: "V:[v0(44)]", views: titleLabel)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: player.view, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: player.view, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: bundleImageView, attribute: .right, multiplier: 1, constant: 8))
        
    }
}


extension UIView {
    func getURL(vu: URL) -> URL{
        let url = vu
        return url
    }
}


