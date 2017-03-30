//
//  bundleDetailController.swift
//  AppStore
//
//  Created by Wenqi Wang on 26/03/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class BundleDetailController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var bundle: Bundle? {
        didSet {
            navigationItem.title = bundle?.name
        }
    }
    
    private let headerId = "headerId"
    
    var featuredBundles: FeaturedBundles?
    var bannerCategory: BundleCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredBundles = BundleCategory.sampleBundleCategories().first
        bannerCategory = featuredBundles?.bannerCategory
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(BundleDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    //set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:view.frame.width, height:200)
    }
    
    //deque header cell
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! BundleDetailHeader
        
        header.bundleCategory = bannerCategory
        
        return header
    }
    
}

class BundleDetailHeader: CategoryCell{

    let cellId = "bannerCellId"
    
    override func setupViews() {
        //super.setupViews()
        
        bundlesCollectionView.dataSource = self
        bundlesCollectionView.delegate = self
        
        bundlesCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(bundlesCollectionView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":bundlesCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":bundlesCollectionView]))
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BundleCell
        cell.bundle = bundleCategory?.bundles?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
        
    }
    
    public class BannerCell: BundleCell {
        internal override func setupViews() {
            super.setupViews()
            imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            imageView.layer.borderWidth = 0.5
            imageView.layer.cornerRadius = 0
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = UIColor.lightGray
            addSubview(imageView)
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
        }
    }
    
    
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
    
}

