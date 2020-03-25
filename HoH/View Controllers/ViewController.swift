//
//  ViewController.swift
//  HoH
//
//  Created by Nga Thi Phuong Le on 2020-03-12.
//  Copyright © 2020 Jolene. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var IBOutlet_Image_View: UITableView!
    @IBOutlet weak var IBOulet_Image: UIImageView!
    @IBOutlet weak var IBOutlet_Image_Text: UITextView!
    
    var articleArray = [Article]()
    let cellID = "cellID"
    var received_article = Article(title: "", content: "", image: nil)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IBOutlet_Image_View.delegate = self
        IBOutlet_Image_View.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = articleArray[indexPath.row].title
        cell?.detailTextLabel?.text = articleArray[indexPath.row].content
        cell?.imageView?.image = articleArray[indexPath.row].image
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = articleArray[indexPath.row]
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
            //Just dismiss the action sheet
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil) }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mainArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
//        if (cell == nil) {
//            cell = UITableViewCell(
//                style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellID)
//        }
//        cell?.textLabel?.text = mainArray[indexPath.row]
//        cell?.detailTextLabel?.text = detailArray[indexPath.row]
//        cell?.imageView?.image = UIImage(named: imageArray[indexPath.row])
//        return cell!
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedItem = mainArray[indexPath.row]
//        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
//            //Just dismiss the action sheet
//        })
//        alert.addAction(okAction)
//        self.present(alert, animated: true, completion: nil) }
    
    @IBAction func IBOulet_New_Post(_ sender: UIButton) {
//        self.articleArray.insert(received_article!, at: 0)
    }
    
    
    
    
}
