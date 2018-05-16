//
//  ViewController.swift
//  PhothCameraSwift
//
//  Created by lzhl_iOS on 2017/3/16.
//  Copyright © 2017年 lzhl_iOS_LPC. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
    private var photoBtn: UIButton = {
       
        let btn = UIButton()
        btn.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        btn.backgroundColor = UIColor.red
        btn.setImage(UIImage(named:"123") , for: .normal)
        btn.layer.cornerRadius = btn.bounds.size.width/2
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(photoCameraAction), for: .touchUpInside)
        
        return btn
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoBtn.center = view.center
        
        view.addSubview(photoBtn)
        
        if UserDefaults.standard.value(forKey: "photo") != nil  {
            
            let dataPhoto = UserDefaults.standard.value(forKey: "photo") as! Data
            let image = UIImage(data: dataPhoto )! as UIImage
            
            self.photoBtn.setImage(image, for: .normal)
            
        } else {
            
            self.photoBtn.setImage(UIImage(named:"123") , for: .normal)
        }
        
    }
    
    func photoCameraAction() {
        
        let imagePickerC = UIImagePickerController()
        imagePickerC.delegate = self
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        let photos = UIAlertAction(title: "本地相册", style: .default) { _ in
           
            imagePickerC.sourceType = .photoLibrary
            self.present(imagePickerC, animated: true, completion: nil)
        }
        
        let camera = UIAlertAction(title: "相机", style: .default) { (UIAlertAction) -> Void in
            
            imagePickerC.sourceType = .camera
            self.present(imagePickerC, animated: true, completion: nil)
        }
        
        alert.addAction(cancel)
        alert.addAction(photos)
        alert.addAction(camera)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
 
        /*
         info 包含的字段
         UIImagePickerControllerMediaType   用户选择的媒体类型
         UIImagePickerControllerReferenceURL    原件的URL
         UIImagePickerControllerOriginalImage   原始图片
        */
        
        let Newimage: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
  
        let imageSmall = clipImage(image: Newimage, Size: photoBtn.bounds.size)
        let data = UIImageJPEGRepresentation(imageSmall, 0.5)
        
        //MARK:压缩成二进制文件存储头像
        UserDefaults.standard.set(data, forKey: "photo")
        UserDefaults.standard.synchronize()

        
        
        photoBtn.setImage(Newimage, for: .normal)
    
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:剪裁图片
    func clipImage(image: UIImage ,Size:CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(Size)
        image.draw(in: CGRect(x: 0, y: 0, width: Size.width, height: Size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage;
    }

}

