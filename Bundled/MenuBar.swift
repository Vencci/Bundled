//
//  MenuBar.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 03/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 32/255, green: 150/255, blue: 230/255, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellID = "cellID"
    
    let imageNames = ["summary", "shopping", "preparation", "recipe"]
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
        
        addSubview(collectionView)
        addConstrainsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstrainsWithFormat(format: "V:|[v0]|", views: collectionView)
        //初始点击在summary，把item改成”1“
        let selectedIndexPath = NSIndexPath(item: 1, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init coder has not been implemented")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        cell.backgroundColor = UIColor.yellow
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "summary")?.withRenderingMode(.alwaysTemplate)
//        iv.backgroundColor = UIColor.blue
        return iv
    }()
   
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.black : UIColor.green
        }
    
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.black : UIColor.green
        }
        
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addConstrainsWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstrainsWithFormat(format: "V:[v0(28)]", views: imageView)
        addConstraints([NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)])
        addConstraints([NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
    }
    
    
}
