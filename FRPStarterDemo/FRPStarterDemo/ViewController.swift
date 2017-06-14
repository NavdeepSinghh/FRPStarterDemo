//
//  ViewController.swift
//  FRPStarterDemo
//
//  Created by Navdeep  Singh on 6/14/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import UIKit
// FRP library for the swift language
import ReactiveSwift
// Extensions on Cocoacontrols such as textfields etc
import ReactiveCocoa

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Checking for the valid user name and password : Signals
        let validUsername = usernameTextField.reactive.continuousTextValues
                                        .skipNil()
                                        .map{ $0.characters.count > 0 }
        let validPassword = passwordTextField.reactive.continuousTextValues
                                        .skipNil()
                                        .map{ $0.characters.count > 0 }
        
        // We can combine signals to act upon combined values
        
        loginButton.reactive.isEnabled <~ Signal.combineLatest(validUsername, validPassword)
                                                                .map{ $0 && $1}
    }
}
// No need for extensions
