//
//  UserDefaultsModels.swift
//  PhothCameraSwift
//
//  Created by lzhl_iOS on 2017/3/16.
//  Copyright © 2017年 lzhl_iOS_LPC. All rights reserved.
//

import UIKit

class UserDefaultsModels: NSObject {
    
    func saveUserInfoWithUserDefaults(userInfo:Any) {
    
        let userDefault = UserDefaults.standard
        userDefault.set(userInfo, forKey: "photo")
        userDefault.synchronize()
    }
    
    func loadUserInfoToUserDefaults() -> Any? {
        
        let userDefault = UserDefaults.standard
        let data: Data = userDefault.data(forKey: "photo")!
        let userImage: UIImage = UIImage(data: data)!
        
        return userImage
    }
    
}
