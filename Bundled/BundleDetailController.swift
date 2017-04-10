//
//  bundleDetailController.swift
//  AppStore
//
//  Created by Wenqi Wang on 26/03/2017.
//  Copyright © 2017 Wenqi Wang. All rights reserved.
//

import UIKit

class BundleDetailController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var bundle: Bundles? {
        didSet {
            //navigationItem.title = bundle?.name
        }
    }
    
    var bundleDetailHeader = BundleDetailHeader()
    
    private let headerId = "headerId"
    private let TimePriceCellId = "TimePriceCellId"
    private let RecipeCellId = "RecipeCellId"
    private let DescriptionCellId = "DescriptionCellId"
    //private let ReviewCellId = "ReviewCellId"
    //private let ShoppingListId = "ShoppingListId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print((bundle?.name)! + " printed in bundle detail view did load")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "PREP NOW!", style: .plain, target: self, action: #selector(GoToTabbar))
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(BundleDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(TimePriceCell.self, forCellWithReuseIdentifier: TimePriceCellId)
        collectionView?.register(RecipeCell.self, forCellWithReuseIdentifier: RecipeCellId)
        collectionView?.register(DescriptionCell.self, forCellWithReuseIdentifier: DescriptionCellId)
    }
    
    func GoToTabbar() {
        self.showBundleDetailTabBarForBundle(bundle: bundle!)
    }
    
    func showBundleDetailTabBarForBundle(bundle: Bundles) {
        let layout = UICollectionViewFlowLayout()
        let tabbarController = TabBarController()
        tabbarController.bundle = bundle
        let preparationController = PreparationController(collectionViewLayout: layout)
        preparationController.bundle = bundle
        navigationController?.pushViewController(tabbarController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
            case 0:
                return CGSize(width:view.frame.width, height:100)
            case 1:
                return CGSize(width:view.frame.width, height:400)

            default:
                return CGSize(width:view.frame.width, height:200)
            }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            switch indexPath.item {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimePriceCellId, for: indexPath) as! TimePriceCell
                cell.bundle = bundle
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCellId, for: indexPath) as! RecipeCell
                cell.bundle = bundle
                return cell

            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: TimePriceCellId, for: indexPath) as! TimePriceCell
            }
    }
    
    
    //set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:view.frame.width, height:200)
    }
    
    //deque header cell
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! BundleDetailHeader
        header.bundle = bundle
        return header
    }
    
}

class BundleDetailHeader: BaseCell{
    
    let cellId = "bannerCellId"
    
    var bundle: Bundles? {
        didSet {
            if let imageName = bundle?.imageName {
                imageView.image = UIImage(named: imageName)
                imageView.clipsToBounds = true
            }
            bundleLabel.text = bundle?.name
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(bundleLabel)
        
        //bundleLabel.centerXAnchor.constraint(equalTo: bundleLabel.superview!.centerXAnchor).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        

        addConstraintsWithFormat(format: "V:|-100-[v0(40)]", views: bundleLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: bundleLabel)

        addConstraintsWithFormat(format: "H:|[v0]|", views: segmentedControl)
        addConstraintsWithFormat(format: "V:[v0(34)]|", views: segmentedControl)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(166)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
        
        segmentedControl.addTarget(self, action: #selector(BundleDetailHeader.selectionChanged(_:)), for: .valueChanged)
    }
    
    public let segmentedControl :UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details", "Reviews", "Shopping List"])
        sc.tintColor = UIColor.darkGray
        sc.selectedSegmentIndex = 0

        return sc
    }()
    
    func selectionChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            print("details selected")
            
        case 1:
            print("reviews selected")
            //let segReview = BundleReview
            
        case 2:
            print("shopping list selected")
        default:
            break
        }
    }
    
    let bundleLabel: UILabel = {
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

}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
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
