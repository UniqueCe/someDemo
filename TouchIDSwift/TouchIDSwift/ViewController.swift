//
//  ViewController.swift
//  TouchIDSwift
//
//  Created by lzhl_iOS on 2017/3/24.
//  Copyright © 2017年 lzhl_iOS_LPC. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func ClickAction(_ sender: Any) {
        
        TouchIDUnlock()
    }

    func TouchIDUnlock() {
        
        let context = LAContext()
        
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "TouchID", reply: { (success, error) in
                
                if success {
                self.AlertControllerWithMessage(message:"╰(*°▽°*)╯解锁成功╰(*°▽°*)╯")
                    
                }else {
        
                    self.AlertControllerWithMessage(message:"/(ㄒoㄒ)/~~解锁失败/(ㄒoㄒ)/~~ 原因:\(error)")
                }
            })
        }else {
            
            AlertControllerWithMessage(message: "😭设备不支持TouchID😭")
        }
    }
    
    func AlertControllerWithMessage(message:String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            
            self.dismiss(animated: true, completion: nil)
        }
    }

}

