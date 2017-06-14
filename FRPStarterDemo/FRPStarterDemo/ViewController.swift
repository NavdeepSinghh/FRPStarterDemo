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
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension ViewController : UITextFieldDelegate{
    func isFormValid() -> Bool {
        return (usernameTextField.text?.characters.count )! > 0 &&
                  (passwordTextField.text?.characters.count)! > 0
    }
    
    // Enable login button only if both the textfields have some value
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        loginButton.isEnabled = isFormValid()
        return true
    }
}

