//
//  AppDelegate.swift
//  testDemo
//
//  Created by LPC_MBP on 2019/9/6.
//  Copyright © 2019 Mac_LPC. All rights reserved.
//

import UIKit
import UserNotifications

let kNotificationMessage = "NotificationMessage"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge]) { (success, error) in
            
            print((success ? "用户授权":"无权限！！！"))
            if success {
                print("用户授权")
            }else {
                self.alertNotificationCenter()
            }
        }
        
        center.delegate = self
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    
    private func alertNotificationCenter() {
        
        let alert = UIAlertController(title: "提示", message: "通知权限未打开，会影响您对消息的接受", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "设置", style: .default, handler: { (_) in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options:[:], completionHandler: nil)
        }))
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    /*
     只有当应用程序位于前台时，才会对委托调用该方法。如果方法没有实现，或者没有及时调用处理程序，则不会显示通知。应用程序可以选择将通知显示为声音、徽章、警报和/或在通知列表中。此决定应基于通知中的信息是否对用户可见。
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print(notification.request.content.title,
              notification.request.content.body,
              notification.request.content.subtitle)
        print("333")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotificationMessage), object: nil, userInfo: ["title":notification.request.content.title,"body":notification.request.content.body,"subtitle":notification.request.content.subtitle])
    }
    
    /*
     当用户打开应用程序、取消通知或选择UNNotificationAction来响应通知时，该方法将在委托上调用。必须在应用程序从application:didFinishLaunchingWithOptions:返回之前设置委托。
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print(response.notification.request.content.title)
        print(response.notification.request.content.body)
        print(response.notification.request.content.subtitle)
        print("222")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotificationMessage), object: nil, userInfo: ["title":response.notification.request.content.title,"body":response.notification.request.content.body,"subtitle":response.notification.request.content.subtitle])
    }
    
    /*
     当应用程序响应用户查看应用程序内通知设置的请求启动时，该方法将在委托上调用。将UNAuthorizationOptionProvidesAppNotificationSettings作为requestAuthorizationWithOptions:completionHandler中的一个选项添加到在线通知设置视图和设置中的通知设置视图中。从设置中打开时，通知将为nil。
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        
        print(notification?.request as Any)
        print("1111")
    }
}
