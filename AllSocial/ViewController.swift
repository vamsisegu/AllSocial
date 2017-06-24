//
//  ViewController.swift
//  AllSocial
//
//  Created by VAMSI'S on 5/15/17.
//  Copyright © 2017 VAMSI'S. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBAction func camera(_ sender: Any) {
        let image = UIImagePickerController()
        
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.camera
        
        image.allowsEditing = true
        
        self.present(image, animated: true)
        {
            
        }

    }
    
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = true
        
        self.present(image, animated: true)
        {
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            myImageView.image = image
        } else {
            print("Error Message")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Share", message: "Share the status of the Day", preferredStyle: .actionSheet)
        
        let firstAction = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            print("Success")
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText("Hello World")
                
                post.add(self.myImageView.image)
                
                self.present(post, animated: true, completion: nil)
                
            } else{
                self.showAlert(service: "Facebook")
            }
        }
        
        let secondAction = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            print("Success")
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText("Hello World")
                
                post.add(self.myImageView.image)
                
                self.present(post, animated: true, completion: nil)
                
            } else{
                self.showAlert(service: "Twitter")
            }
        }
        
        let thirdAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)

        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(service: String){
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

