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

class RecipeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var bundle: Bundles? {
        didSet {
            //navigationItem.title = bundle?.name
            print(bundle?.name ?? "nothing passed to bundle in recipe controller")
        }
    }
    let cellID = "cellID1"
    let headerId = "headerId"
    let footerId = "footerId"
    var videoView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title = "Preparation"
        
        navigationController?.navigationBar.isTranslucent = false
        let titleLable = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLable.text = "Preparation"
        titleLable.textColor = UIColor.white
        navigationItem.titleView = titleLable
        titleLable.font = UIFont.systemFont(ofSize: 20)
        collectionView?.backgroundColor = UIColor.white
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellVideo")
        collectionView?.register(RecipeHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(RecipeFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        
        collectionView?.register(RecipeStepCell.self, forCellWithReuseIdentifier: cellID)
        
        //collectionView?.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(40, 0, 0, 0)
        
    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (bundle?.recipes?.count)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (bundle?.recipes![section].steps.count)!
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! RecipeStepCell
        if let recipeStep = bundle?.recipes?[indexPath.section].steps[indexPath.item] {
            cell.recipeStep = recipeStep
            cell.recipe = bundle?.recipes?[indexPath.section]
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let h = (view.frame.width - 16 - 16) * 3 / 4
        return CGSize(width: view.frame.width, height: h + 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:view.frame.width, height:70)
    }
    
    //deque header cell
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! RecipeHeader
            header.recipe = bundle?.recipes?[indexPath.section]
            return header}
        else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId, for: indexPath) as! RecipeFooter
            return footer
        }
        
    }
    
    //set footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 20)
    }
    
}

class RecipeHeader: BaseCell{
    
    let cellId = "bannerCellId"
    
    var recipe: Recipe? {
        didSet {
            if let name = recipe?.name{
                recipeLabel.text = name
            }
        }
    }
    
    let recipeLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor(white: 1, alpha: 0.8)
        label.textAlignment = NSTextAlignment.center
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30)
        label.numberOfLines = 2
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        //addSubview(segmentedControl)
        addSubview(recipeLabel)
        
        //bundleLabel.centerXAnchor.constraint(equalTo: bundleLabel.superview!.centerXAnchor).isActive = true
        
        
        addConstraintsWithFormat(format: "V:|[v0(40)]", views: recipeLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: recipeLabel)
    }
}

class RecipeFooter: BaseCell{
    
    let cellId = "footerCellId"

    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        //addSubview(segmentedControl)
        addSubview(separatorLine)
        
        //bundleLabel.centerXAnchor.constraint(equalTo: bundleLabel.superview!.centerXAnchor).isActive = true
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorLine]))
        
        addConstraintsWithFormat(format: "V:[v0(10)]|", views: separatorLine)
        

    }
}
