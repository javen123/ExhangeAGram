//
//  ProfileViewController.swift
//  ExchangeAGram
//
//  Created by user on 10/30/14.
//  Copyright (c) 2014 Neva. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, FBLoginViewDelegate {
    
        
        @IBOutlet weak var profileImageView: UIImageView!
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var fbLoginView: FBLoginView!
       
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.fbLoginView.delegate = self
            self.fbLoginView.readPermissions = ["public_profile", "publish_actions"]
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
    @IBAction func mapButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("mapSegue", sender: nil)
    }
    
        func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
            profileImageView.hidden = false
            nameLabel.hidden = false
        }
        
        func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
            println(user)
            nameLabel.text = user.name
            let userImageUrl = "https://graph.facebook.com/\(user.objectID)/picture?type=small"
            let url = NSURL(string: userImageUrl)
            let imageData = NSData(contentsOfURL: url!)
            let image = UIImage(data: imageData!)
            profileImageView.image = image
        }
        
        func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
            profileImageView.hidden = true
            nameLabel.hidden = true
        }
        
        func loginView(loginView: FBLoginView!, handleError error: NSError!) {
            println("Error: \(error.localizedDescription)")
        }

}


