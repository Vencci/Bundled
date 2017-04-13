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
        }
    }
    let cellID = "cellID1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title = "Preparation"
        print(bundle?.name ?? "nothing passee to viewdidload in preperation controller")
        
        navigationController?.navigationBar.isTranslucent = false
        let titleLable = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLable.text = "Preparation"
        titleLable.textColor = UIColor.white
        navigationItem.titleView = titleLable
        titleLable.font = UIFont.systemFont(ofSize: 20)
 
        collectionView?.backgroundColor = UIColor.white
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellVideo")
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellID1")
        
        
        //collectionView?.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (self.bundle?.preperations?.count)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let videoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! VideoCell
        videoCell.bundle = self.bundle
        videoCell.prepare = self.bundle?.preperations?[indexPath.item]
        
        self.addChildViewController(videoCell.player)
        
        return videoCell
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
        addConstraintsWithFormat(format: "H:|[v0(30)]-10-[v1]", views: bundleImageView, titleLabel)
        addConstraintsWithFormat(format: "V:|[v0]", views: titleLabel)
        addConstraintsWithFormat(format: "V:|[v0]", views: bundleImageView)
    }
    
}



