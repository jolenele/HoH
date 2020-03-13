//
//  ViewController.swift
//  HoH
//
//  Created by Nga Thi Phuong Le on 2020-03-12.
//  Copyright © 2020 Jolene. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let mainArray = ["Shuttle bus", "Hierarchy", "Exchange", "Padlock"]
    let detailArray = ["6am - 10pm", "Acme corporation", "Ideas worth sharing", "Access denied"]
    let imageArray = ["shuttle.png", "hierarchy.png", "exchange. png", "padlock.png"]
    let cellID = "cellID"
    var received_article = Article(title: "", content: "", image: nil)
    
    @IBOutlet weak var IBOutlet_Image_View: UITableView!
    @IBOutlet weak var IBOulet_Image: UIImageView!
    @IBOutlet weak var IBOutlet_Image_Text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IBOutlet_Image_View.delegate = self
        IBOutlet_Image_View.dataSource = self
        IBOutlet_Image_Text.text = received_article?.content
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = mainArray[indexPath.row]
        cell?.detailTextLabel?.text = detailArray[indexPath.row]
        cell?.imageView?.image = UIImage(named: imageArray[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = mainArray[indexPath.row]
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
            //Just dismiss the action sheet
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil) }
    
    @IBAction func IBOulet_New_Post(_ sender: UIButton) {
//        ImagePickerManager().pickImage(self){
//            img in
//            self.IBOulet_Image.image = img
//            self.IBOutlet_Image_Text.text = String("Hello")
//        }
//            var imgArray = [String]()
//            imgArray.append(String("Hello"))
//        let buttonPosition = sender.convert(CGPoint.zero, to: self.IBOutlet_Image_View)
//        let indexPath = self.IBOutlet_Image_View.indexPathForRow(at: buttonPosition)
//        print("indexPath \(indexPath!)")
//
//        self.IBOutlet_Image_View.beginUpdates()
//         IBOutlet_Image_View.insertRows(at: [IndexPath(row: imgArray.count-1, section: 0)], with: .automatic)
//        self.IBOutlet_Image_View.insertRows(at: [indexPath!], with: .automatic)
//        self.IBOutlet_Image_View.endUpdates()

    }
    
    
    
}
