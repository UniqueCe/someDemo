//
//  ViewController.swift
//  testDemo
//
//  Created by LPC_MBP on 2019/9/6.
//  Copyright © 2019 Mac_LPC. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let view_Progress = YTProgressView.init(progress: 20, width: 10)
//        view_Progress.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        view.addSubview(view_Progress)
        
        NotificationCenter.default.addObserver(self, selector: #selector(NotificationMessageClickAction(_:)), name: NSNotification.Name(rawValue: kNotificationMessage), object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 1
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitle"
        content.body = " bodybodybodybodybodybodybodybody"
        
        // 2
//        let imageName = "applelogo"
//        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
//        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
//        content.attachments = [attachment]
        
        // 3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        // 4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @objc func NotificationMessageClickAction(_ userIfo: Notification) {
        
        let la = UILabel(frame: CGRect(x: 10, y: 100, width: kScreenW - 10, height: 50))
        la.text = userIfo.userInfo!["title"] as? String
        view.addSubview(la)
        
        let la2 = UILabel(frame: CGRect(x: 10, y: 160, width: kScreenW - 10, height: 50))
        la2.text = userIfo.userInfo!["body"] as? String
        view.addSubview(la2)
        
        let la3 = UILabel(frame: CGRect(x: 10, y: 220, width: kScreenW - 10, height: 50))
        la3.text = userIfo.userInfo!["subtitle"] as? String
        view.addSubview(la3)
    }
}
