//
//  PersonModels.swift
//  CoreDataTest
//
//  Created by lzhl_iOS on 2018/5/15.
//  Copyright © 2018年 lzhl_iOS. All rights reserved.
//

import UIKit

class PersonModels: NSObject {

    var name: String?
    var habby: String?
    var age: Int?
    
    init(Name: String, Habby: String, Age: Int = 0) {
        super.init()

        self.name = Name
        self.habby = Habby
        self.age = Age
    }
}
