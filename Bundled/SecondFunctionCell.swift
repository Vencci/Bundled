//
//  FunctionCell.swift
//  Bundled
//
//  Created by Wenqi Wang on 11/04/2017.
//  Copyright © 2017 si zhang. All rights reserved.
//

import UIKit

class SecondFunctionCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let functionImageArray: [UIImage] = [#imageLiteral(resourceName: "Shopping Cart"), #imageLiteral(resourceName: "Restaurant"), #imageLiteral(resourceName: "Cooking Pot")]
    let functionArray = ["Shop", "Prepare", "Cook"]
    
    var bundleDetailController: SecondBundleDetailController?
    
    var bundle: Bundles? {
        didSet {
            
        }
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let dividerLineView: UIView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cellId = "cellId"
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        addSubview(dividerLineView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dividerLineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-10-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView, "v1": dividerLineView]))
        
        
        collectionView.register(FunctionImageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FunctionImageCell
        cell.imageView.image = functionImageArray[indexPath.item]
        cell.titleLabel.text = functionArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            bundleDetailController?.ShowShoppingList(bundle: self.bundle!)
        }
        if indexPath.item == 1 {
            bundleDetailController?.ShowPreparation(bundle: self.bundle!)
        }
        if indexPath.item == 2 {
            bundleDetailController?.ShowRecipe(bundle: self.bundle!)
        }
    }
    
    private class FunctionImageCell: BaseCell {
        
        let titleLabel : UILabel = {
            let iv = UILabel()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.text = ""
            iv.font = UIFont.systemFont(ofSize: 14)
            iv.textColor = UIColor.lightGray
            //iv.backgroundColor = UIColor.gray
            iv.numberOfLines = 1
            return iv
        }()
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.backgroundColor = UIColor(displayP3Red: 236, green: 240, blue: 241, alpha: 1)
            iv.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            iv.layer.borderWidth = 1
            iv.layer.cornerRadius = 0
            
            return iv
        }()
        
        override func setupViews() {
            super.setupViews()
            
            addSubview(imageView)
            addSubview(titleLabel)
            
            addConstraintsWithFormat(format: "H:|-25-[v0(60)]", views: imageView)
            addConstraintsWithFormat(format: "H:|-25-[v0]|", views: titleLabel)
            addConstraintsWithFormat(format: "V:|[v0(60)]-5-[v1]|", views: imageView, titleLabel)
            
        }
    }
}
