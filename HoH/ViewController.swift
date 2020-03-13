//
//  ViewController.swift
//  HoH
//
//  Created by Nga Thi Phuong Le on 2020-03-12.
//  Copyright © 2020 Jolene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var IBOutlet_Image_View: UITableView!
    
    @IBOutlet weak var IBOulet_Image: UIImageView!
    @IBOutlet weak var IBOutlet_Image_Text: UITextView!
    
    var image_picker = UIImagePickerController()
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    
    
    
    @IBAction func IBOulet_New_Post(_ sender: UIButton) {
        ImagePickerManager().pickImage(self){
            img in
            self.IBOulet_Image.image = img
            self.IBOutlet_Image_Text.text = String("Hello")
        }
            var imgArray = [String]()
            imgArray.append(String("Hello"))
        let buttonPosition = sender.convert(CGPoint.zero, to: self.IBOutlet_Image_View)
        let indexPath = self.IBOutlet_Image_View.indexPathForRow(at: buttonPosition)
        print("indexPath \(indexPath!)")
        
        self.IBOutlet_Image_View.beginUpdates()
         IBOutlet_Image_View.insertRows(at: [IndexPath(row: imgArray.count-1, section: 0)], with: .automatic)
        self.IBOutlet_Image_View.insertRows(at: [indexPath!], with: .automatic)
        self.IBOutlet_Image_View.endUpdates()

    }
    
    func numberOfSections(in IBOutlet_Image_View: UITableView) -> Int {
        return 2
    }
    
}
