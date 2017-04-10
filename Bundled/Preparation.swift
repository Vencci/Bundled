//
//  Preparation.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 06/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class Preparation: NSObject {
    var url: URL
    var prepTime: Int
    var desc: String
    var imageName: String
    
    init(url: URL, prepTime: Int, desc: String, imageName: String) {
        self.url = url
        self.prepTime = prepTime
        self.desc = desc
        self.imageName = imageName
    }
}
