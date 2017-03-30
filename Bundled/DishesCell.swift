//
//  DishesCell.swift
//  prepare and recipe
//
//  Created by Wenqi Wang on 28/03/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class DishesCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private let cellId = "stepCellId"
    var bundleCategory:BundleCategory? {
        didSet {
            
            if let name = bundleCategory?.name {
                textLabels.text = name
            }
            
            prepareStepsControlView.reloadData()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    required init? (coder aDecoder: NSCoder){
        fatalError("init(coder) has not been implemented")
    }
    
    let textLabels: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "chop the onions nicely"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let prepareStepsControlView: UICollectionView = { () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews(){
        backgroundColor = UIColor.clear
        addSubview(textLabels)
        
        prepareStepsControlView.dataSource = self
        prepareStepsControlView.delegate = self
        prepareStepsControlView.register(StepCell.self, forCellWithReuseIdentifier: cellId)
        
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
            prepareStepsControlView?.showBundleDetailForBundle(bundle: bundle)
        }
    }
    
    

}
