//
//  ImagePickerManager.swift
//  HoH
//
//  Created by Nga Thi Phuong Le on 2020-03-12.
//  Copyright © 2020 Jolene. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerManager : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var picker = UIImagePickerController()
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickerImageCallBack : ((UIImage) -> ())?
    
    override init() {
        super.init()
    }
    
    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        self.viewController = viewController
        pickerImageCallBack = callback
        
        let chooseImage = UIAlertAction(title: "Camera roll", style: .default){
            UIAlertAction in self.openCameraRoll()
        }
        
        let takeImage = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in self.openCamera()
        }
        
        let cancelImage = UIAlertAction(title: "Cancel", style: .default){
            UIAlertAction in
        }
        
        picker.delegate = self
        alert.addAction(chooseImage)
        alert.addAction(takeImage)
        alert.addAction(cancelImage)
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func openCameraRoll(){
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController!.present(picker, animated: true, completion: nil)
    }
    
    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        if UIImagePickerController .isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else{
            let alertWarn = UIAlertView(title: "Warning", message: "Could not open camera", delegate: nil, cancelButtonTitle: "Cancel")
            alertWarn.show()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let img = info[.originalImage] as? UIImage else {
            fatalError("Expected a gallery containing images, but was provided the: \(info)" )
        }
        pickerImageCallBack?(img)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }
}

