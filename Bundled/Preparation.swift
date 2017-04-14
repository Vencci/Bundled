//
//  Preparation.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 06/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class Preparation: NSObject, NSCoding {
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
    
    public required convenience init?(coder aDecoder: NSCoder) {
        let url = aDecoder.decodeObject(forKey: "url") as? URL
        let prepTime = aDecoder.decodeCInt(forKey: "prepTime")
        let desc = aDecoder.decodeObject(forKey: "desc") as? String
        let imageName = aDecoder.decodeObject(forKey: "imageName") as? String
        self.init(url: url!, prepTime: Int(prepTime), desc: desc!, imageName: imageName!)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(url, forKey: "url")
        aCoder.encode(prepTime, forKey: "prepTime")
        aCoder.encode(desc, forKey: "desc")
        aCoder.encode(imageName, forKey: "imageName")
    }
}
