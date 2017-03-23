//
//  ViewController2.swift
//  Bundled
//
//  Created by si zhang on 17/2/11.
//  Copyright © 2017年 si zhang. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    

    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var textOutput: UILabel!
    
    var imageArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            //mainScrollView.frame = view.frame
            
            
        imageArray = [#imageLiteral(resourceName: "bundle1"), #imageLiteral(resourceName: "delicious-meal-2"), #imageLiteral(resourceName: "delicious-meal-4"), #imageLiteral(resourceName: "delicious-meal-1"), #imageLiteral(resourceName: "delicious-meal-3")]
            for i in 0..<imageArray.count{
                let imageView = UIImageView()
                imageView.image = imageArray[i]
                imageView.contentMode = .scaleAspectFit
                let xPosition = self.view.frame.width *  CGFloat(i)
                imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
                
                mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
                mainScrollView.addSubview(imageView)
            }
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    

}
