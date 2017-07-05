//
//  ViewController.swift
//  Cau2
//
//  Created by Cntt12 on 7/5/17.
//  Copyright © 2017 cntt12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUrl1: UITextField!
    @IBOutlet weak var txtUrl2: UITextField!
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonLoad(_ sender: Any) {
        if txtUrl1.text == "" || txtUrl2.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter URL", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            LoadImage(url1: txtUrl1.text!, url2: txtUrl2.text!)
        }
    }
    
    func LoadImage(url1: String, url2: String) {
        let urlSes1 = URL(string: url1)
        let urlSes2 = URL(string: url2)
        
        (URLSession(configuration: .default)).dataTask(with: urlSes1!, completionHandler: { (data, respone, error) in
            if let imageData = data {
                DispatchQueue.main.async { () -> Void in
                    self.imageView1.image = UIImage(data: imageData)
                }
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(action)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }).resume()
        
        (URLSession(configuration: .default)).dataTask(with: urlSes2!, completionHandler: { (data, respone, error) in
            if let imageData = data {
                DispatchQueue.main.async { () -> Void in
                    self.imageView2.image = UIImage(data: imageData)
                }
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(action)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }).resume()
    }
    
}
