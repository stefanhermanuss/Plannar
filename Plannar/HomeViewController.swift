//
//  HomeViewController.swift
//  Plannar
//
//  Created by Stefan Hermanus on 5/20/20.
//  Copyright © 2020 Stefan Corporation. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

class HomeViewController: UIViewController{
    
    var name: String?
    var ref: DatabaseReference!
    
    @IBOutlet var welcomeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid
        print("my id is")
        print(userID!)
        ref.child("users").child(userID!).child("Name").observeSingleEvent(of: .value) { (snapshot) in
            guard let username = snapshot.value as? String else { return }
            
            UIView.animate(withDuration: 0.5) {
                self.welcomeText.text = "Welcome to Plannar, \(username)"
            }
        }
    }

    
}
