//
//  ViewController.swift
//  CoreDataTest
//
//  Created by lzhl_iOS on 2018/5/11.
//  Copyright © 2018年 lzhl_iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataSoure = [PersonModels]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       dataSoure = CoreDataManager.shared.selectCoreData(dataName: "Person")
        print("===查询===",dataSoure.count)
        for p: PersonModels in dataSoure {
            print("name:  \((p.name)!) age: \((p.age)!)")
        }

        sleep(2)
        CoreDataManager.shared.removeData(dataName: "Person", removeName: "历史")
        
        sleep(4)
        print("修改")
        CoreDataManager.shared.upDateData(dataName: "Person", oldName: "张三", newUpName: "说那暗示") == true ? print("成功"):print("失败")
        print("=======00000")
        CoreDataManager.shared.upDateData(dataName: "Person", oldName: "as", newUpName: "暗示") == true ? print("成功"):print("失败")
        
        sleep(6)
        print("写入")
        let dict:[[String:Any]] = [
                                    ["name":"张三", "age":7822, "hobby":"男"],
                                    ["name":"历史", "age":22, "hobby":"女"]
                                  ]
        
        for d:[String:Any] in dict {
          CoreDataManager.shared.insertCoreData(dataName: "Person", dict: d) == true ? print("成功"):print("失败")
        }
        dataSoure = CoreDataManager.shared.selectCoreData(dataName: "Person")
        print("===查询===",dataSoure.count)
        for p: PersonModels in dataSoure {
            print("name:  \((p.name)!) age: \((p.age)!) hobby:\((p.habby)!)")
        }
    }
}

