//
//  CoreDataManager.swift
//  CoreDataTest
//
//  Created by lzhl_iOS on 2018/5/11.
//  Copyright © 2018年 lzhl_iOS. All rights reserved.
//

import UIKit
import CoreData


class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager()
    // 容器
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            print("--",storeDescription,"--")
        })
        return container
    }()

    func getContext () -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    /// 写入数据
    func insertCoreData(dataName: String, dict:[String:Any]) -> Bool {
        
        var inserSuccess: Bool = false
        
        let context = getContext()
        // 定义一个entity，这个entity一定要在xcdatamodeld中做好定义
        let entity = NSEntityDescription.entity(forEntityName: dataName, in: context)
        
        let person = NSManagedObject(entity: entity!, insertInto: context)
        
        person.setValuesForKeys(dict)
        
        do {
            try context.save()
            inserSuccess = true
        }catch{
            print(error)
        }
        
        return inserSuccess
    }
    
    // 获取某一模型的数据
    ///
    /// - Parameter dataName: 数据库名称
    func selectCoreData(dataName: String)  -> [PersonModels]{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: dataName)
        var personArray = [PersonModels]()
        
        do {
            if let searchResults = try getContext().fetch(fetchRequest) as? [NSManagedObject] {
                
                for p in searchResults {
                    let tempPerson = translateData(from: p)
                    personArray.append(tempPerson!)
                }
            }
        } catch  {
            print(error)
        }
        
        return personArray
    }
    
    /// 删除数据
    func removeData(dataName: String, removeName: String) {
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        
        let entity = NSEntityDescription.entity(forEntityName: dataName, in: getContext())
        fetchRequest.entity = entity
    
        let predicate = NSPredicate.init(format: "name = '\(removeName)'", "")
        fetchRequest.predicate = predicate
        
        do {
            
            let fetchedObjects = try getContext().fetch(fetchRequest) as! [NSManagedObject]
            for one in fetchedObjects {
                getContext().delete(one)
                try getContext().save()
            }
            
        } catch  {
            let nserror = error as NSError
            fatalError("查询错误： \(nserror), \(nserror.userInfo)")
        }
    }
    
    /// 更新数据
    func upDateData(dataName: String, oldName: String, newUpName: String) -> Bool {
        
        var success: Bool = false
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        
        let entity = NSEntityDescription.entity(forEntityName: dataName, in: getContext())
        fetchRequest.entity = entity
        
        let predicate = NSPredicate.init(format: "name = '\(oldName)'", "")
        fetchRequest.predicate = predicate
        
        do {
            
            let fetchedObjects = try getContext().fetch(fetchRequest) as! [Person]
            
            for one: Person in fetchedObjects {
                one.name = newUpName
                try getContext().save()
                success = true
            }
            
        } catch  {
            let nserror = error as NSError
            fatalError("更新错误： \(nserror), \(nserror.userInfo)")
        }
        return success
    }
    
    /**
        把相应的 NSManagedObject 转成 Models
     */
    func translateData(from: NSManagedObject) -> (PersonModels?) {
        
        if  let name = from.value(forKey: "name") as? String,
            let age = from.value(forKey: "age") as? Int,
            let hobby = from.value(forKey: "hobby") as? String {
                
            let p = PersonModels(Name: name, Habby: hobby, Age: age)
            return p
        }
        return nil
    }
}
