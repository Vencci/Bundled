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
            print(bundle?.name ?? "nothing passed to bundle in preparation controller")
        }
    }
    let cellID = "cellID1"
    var videoView = UIView()
    
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
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(PreparationController.goBack))
        navigationItem.leftBarButtonItem = backButton
        collectionView?.backgroundColor = UIColor.white
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellVideo")
        
        collectionView?.register(RecipeStepCell1.self, forCellWithReuseIdentifier: "cellID1")
        collectionView?.register(RecipeStepCell2.self, forCellWithReuseIdentifier: "cellID2")
        collectionView?.register(RecipeStepCell3.self, forCellWithReuseIdentifier: "cellID3")
        collectionView?.register(RecipeStepCell4.self, forCellWithReuseIdentifier: "cellID4")
        collectionView?.register(RecipeStepCell5.self, forCellWithReuseIdentifier: "cellID5")
        collectionView?.register(RecipeStepCell6.self, forCellWithReuseIdentifier: "cellID6")
        collectionView?.register(RecipeStepCell7.self, forCellWithReuseIdentifier: "cellID7")
        collectionView?.register(RecipeStepCell8.self, forCellWithReuseIdentifier: "cellID8")
        collectionView?.register(RecipeStepCell9.self, forCellWithReuseIdentifier: "cellID9")

        
        //collectionView?.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(40, 0, 0, 0)
        
    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            switch indexPath.item {
            case 0:
                let videoCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! RecipeStepCell1
                return videoCell1
            case 1:
                let videoCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID2", for: indexPath) as! RecipeStepCell2
                return videoCell2
            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! RecipeStepCell1
        }
        }
        
        if indexPath.section == 1 {
            switch indexPath.item {
            case 0:
                let videoCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID3", for: indexPath) as! RecipeStepCell3
                return videoCell1
            case 1:
                let videoCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID4", for: indexPath) as! RecipeStepCell4
                return videoCell2
            case 2:
                let videoCell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID5", for: indexPath) as! RecipeStepCell5
                return videoCell3
            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! RecipeStepCell1
        }
        }
        
        if indexPath.section == 2 {
            switch indexPath.item {
            case 0:
                let videoCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID6", for: indexPath) as! RecipeStepCell6
                return videoCell1
            case 1:
                let videoCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID7", for: indexPath) as! RecipeStepCell7
                return videoCell2
            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! RecipeStepCell1
            }
        }
        
        if indexPath.section == 3 {
            switch indexPath.item {
            case 0:
                let videoCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID8", for: indexPath) as! RecipeStepCell8
                return videoCell1
            case 1:
                let videoCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID9", for: indexPath) as! RecipeStepCell9
                return videoCell2
            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! RecipeStepCell1
            }
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! RecipeStepCell1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let h = (view.frame.width - 16 - 16) * 3 / 4
        return CGSize(width: view.frame.width, height: h + 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

    




