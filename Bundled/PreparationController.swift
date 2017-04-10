//
//  ViewController.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 31/03/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class PreparationController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var bundle: Bundles? {
        didSet {
            //navigationItem.title = bundle?.name
            print(bundle?.name ?? "nothing passed to bundle in preparation controller")
        }
    }
    let cellID = "cellID1"
    var videoView = UIView()
    
    let beatEggs = Preparation(url: eggURL, prepTime: 10, desc: "BEAT eggs, milk and nutmeg in shallow dish until blended.", imageName: "beategg")
    let sliceBeef = Preparation(url: beefURL, prepTime: 5, desc: "slice beef into thin strips.", imageName: "beef")
    let peelCarrot = Preparation(url: carrotURL, prepTime: 2, desc: "peel carrots nicely, and cut them into prices", imageName: "carrot")
    let chopOnion = Preparation(url: cutonionURL, prepTime: 2, desc: "chop onion nicely", imageName: "cutonion")
    let cutPotato = Preparation(url: cutpotatoURL, prepTime: 3, desc: "peel the potatos, and cut them into pieces", imageName: "cutpotato")
    let peelPinapple = Preparation(url: pinnappleURL, prepTime: 5, desc: "peel and cut the pineapple", imageName: "pinnapple")
    let chopBeans = Preparation(url: beanURL, prepTime: 2, desc: "wash and cut the green beans", imageName: "beans")
    let peelsalmon = Preparation(url: peelsalmonURL, prepTime: 5, desc: "take the skin off a salmon", imageName: "peelsalmon")
    let trimBroccoli = Preparation(url: cutbroccoliURL, prepTime: 3, desc: "trim broccoli rabe", imageName: "cutbroccoli")
    
    var prepares = [Preparation]()
    
    func append(){
        prepares.append(beatEggs)
        prepares.append(sliceBeef)
        prepares.append(peelCarrot)
        prepares.append(chopBeans)
        prepares.append(cutPotato)
        prepares.append(peelPinapple)
        prepares.append(chopBeans)
        prepares.append(peelsalmon)
        prepares.append(trimBroccoli)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title = "Preparation"
        append()
        print(bundle?.name ?? "nothing passee to viewdidload in preperation controller")
        
        navigationController?.navigationBar.isTranslucent = false
        let titleLable = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLable.text = "Preparation"
        titleLable.textColor = UIColor.white
        navigationItem.titleView = titleLable
        titleLable.font = UIFont.systemFont(ofSize: 20)
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(PreparationController.goBack))
        navigationItem.leftBarButtonItem = backButton
        collectionView?.backgroundColor = UIColor.white
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellVideo")
        
        collectionView?.register(VideoCell1.self, forCellWithReuseIdentifier: "cellID1")
        collectionView?.register(VideoCell2.self, forCellWithReuseIdentifier: "cellID2")
        collectionView?.register(VideoCell3.self, forCellWithReuseIdentifier: "cellID3")
        collectionView?.register(VideoCell4.self, forCellWithReuseIdentifier: "cellID4")
        collectionView?.register(VideoCell5.self, forCellWithReuseIdentifier: "cellID5")
        collectionView?.register(VideoCell6.self, forCellWithReuseIdentifier: "cellID6")
        
        //collectionView?.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(40, 0, 0, 0)

    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0:
            let videoCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! VideoCell1
            return videoCell1
        case 1:
            let videoCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID2", for: indexPath) as! VideoCell2
            return videoCell2
        case 2:
            let videoCell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID3", for: indexPath) as! VideoCell3
            return videoCell3
        case 3:
            let videoCell4 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID4", for: indexPath) as! VideoCell4
            return videoCell4
        case 4:
            let videoCell5 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID5", for: indexPath) as! VideoCell5
            return videoCell5
        case 5:
            let videoCell6 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID6", for: indexPath) as! VideoCell6
            return videoCell6
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! VideoCell1
            
        }

        //videoCell.videoName = prepares[indexPath.item].imageName
        //print((videoCell.prepare?.desc)! + "video cell prepare description printed")
        
        //videoCell.bundle = bundle
        //videoCell.prepareC = self
        
        //self.addChildViewController(videoCell.moviePlayerController)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let h = (view.frame.width - 16 - 16) * 3 / 4
        return CGSize(width: view.frame.width, height: h + 16 + 68)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class HeaderView: BaseCell {
    
    let titleLabel: UILabel = {
        let lable = UILabel()
        lable.backgroundColor = UIColor.yellow
        lable.text = "dish introduction and name"
        lable.numberOfLines = 2
        return lable
    }()
    
    let bundleImageView: UIImageView = {
        let imageView1 = UIImageView()//this name should be different from the imageView
        imageView1.backgroundColor = UIColor.red
        imageView1.image = UIImage(named: "bundle image name")
        imageView1.layer.cornerRadius = 2
        imageView1.layer.masksToBounds = true
        return imageView1
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.blue
        addSubview(titleLabel)
        addSubview(bundleImageView)
        addConstrainsWithFormat(format: "H:|[v0(30)]-10-[v1]", views: bundleImageView, titleLabel)
        addConstrainsWithFormat(format: "V:|[v0]", views: titleLabel)
        addConstrainsWithFormat(format: "V:|[v0]", views: bundleImageView)
    }
    
}



