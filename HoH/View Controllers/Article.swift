//
//  Article.swift
//  HoH
//
//  Created by Nga Thi Phuong Le on 2020-03-13.
//  Copyright © 2020 Jolene. All rights reserved.
//

import UIKit

class Article {
    var title: String
    var content: String
    var image: UIImage?
    
    init?(title: String, content: String, image: UIImage?){
        if title.isEmpty || content.isEmpty {
            return nil
        }
        self.title = title
        self.content = content
        self.image = image
    }
}
