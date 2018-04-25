//
//  RegistrationUserViewController.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class RegistrationUserViewController: UIViewController {
 
  // MARK: - Porperties
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  var userInfo: User!
  
  // Mark: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.firstNameTextField.text = userInfo.firstName
    self.lastNameTextField.text = userInfo.lastName
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
