//
//  MainNavigationController.swift
//  Plannar
//
//  Created by Stefan Hermanus on 5/22/20.
//  Copyright © 2020 Stefan Corporation. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MainNavigationController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        do{
            try Auth.auth().signOut()
        }catch{
            print("error cuk")
        }
        
        authenticateSession()
    }
    
    func authenticateSession(){
        
        if Auth.auth().currentUser == nil{
            print("Not logged in")
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }else{
            print("logged in")
            viewControllers = [HomeViewController()]
        }
        
    }
    
    @objc func showLoginController(){
        print("showing login view")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}

