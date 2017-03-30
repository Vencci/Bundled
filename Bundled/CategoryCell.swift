//
//  CategoryCell.swift
//  AppStore
//
//  Created by Wenqi Wang on 25/03/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var featuredBundlesController : FeaturedBundlesController?
    var myBundle = Bundle(id: 123, name: "Bname", category: "Bcatagory", imageName: "Bimage", price: 123)
    var bundleName : String?
    var xxx = ""
    
    
    
    var bundleCategory:BundleCategory? {
        didSet {
            
            if let name = bundleCategory?.name {
                nameLabel.text = name
            }
            //myBundle.setName(bName: "first week")
            //bundleName = myBundle.getName()
            bundlesCollectionView.reloadData()
        }
    }
    
    private let cellId = "appCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "Best New Bundles: "
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bundlesCollectionView: UICollectionView = { () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let dividerLineView: UIView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {
        backgroundColor = UIColor.clear
        myBundle.setName(bName: "this week")
        let name1 = myBundle.getName()
        nameLabel.text! += name1
        
        addSubview(bundlesCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)
        
        bundlesCollectionView.dataSource = self
        bundlesCollectionView.delegate = self
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        
        bundlesCollectionView.register(BundleCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dividerLineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":bundlesCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":bundlesCollectionView, "v1": dividerLineView, "nameLabel": nameLabel]))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = bundleCategory?.bundles?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BundleCell
        cell.bundle = bundleCategory?.bundles?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let bundle = bundleCategory?.bundles?[indexPath.item] {
            featuredBundlesController?.showBundleDetailForBundle(bundle: bundle)
        }
    }
}


class BundleCell: UICollectionViewCell {
    
    var bundle: Bundle? {
        didSet {
            if let name = bundle?.name{
                nameLabel.text = name
                
                let rect = NSString(string:name).boundingRect(with: CGSize(width: frame.width,height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14)], context: nil)
                
                if rect.height > 20 {
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
                } else {
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 40, width: frame.width, height: 20)
                }
                
                nameLabel.frame = CGRect(x: 0, y: frame.width + 5, width: frame.width, height: 40)
                nameLabel.sizeToFit()

            }
            
            categoryLabel.text = bundle?.category
            
            if let price = bundle?.price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
            
            if let imageName = bundle?.imageName {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = { () -> UIImageView in
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
        
    }()
    
    let nameLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "Simple Made Delicious"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = { () -> UILabel in
    let label = UILabel()
    label.text = "Asian Fusion"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = UIColor.darkGray

    return label
    }()
    
    let priceLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "$9.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()


    
    func setupViews() {
        
        imageView.backgroundColor = UIColor.darkGray
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
    }
    
}
