//
//  PostNewArticleController.swift
//  HoH
//
//  Created by Nga Thi Phuong Le on 2020-03-13.
//  Copyright © 2020 Jolene. All rights reserved.
//

import UIKit

class PostNewArticleController: UIViewController {
//    var new_article = Article()
    @IBOutlet weak var IBOutlet_Image_Upload: UIImageView!
    @IBOutlet weak var IBOutlet_Title_Upload: UITextField!
    @IBOutlet weak var IBOutlet_Content_Upload: UITextField!
    @IBAction func IBOutet_Button_Upload(_ sender: Any) {
        ImagePickerManager().pickImage(self){
            img in
            self.IBOutlet_Image_Upload.image = img
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ImagePickerManager().pickImage(self){
//            img in
//            self.IBOutlet_Image_Upload.image = img
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "firstLink", sender: self) }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ViewController
//        var new_article = Article(title: String(self.IBOutlet_Title_Upload.text!), content: String(self.IBOutlet_Content_Upload.text!), image: self.IBOutlet_Image_Upload.image)
        nextVC.articleArray.insert(Article(title: String(self.IBOutlet_Title_Upload.text!), content: String(self.IBOutlet_Content_Upload.text!), image: self.IBOutlet_Image_Upload.image)!, at: 0)
    }
}
