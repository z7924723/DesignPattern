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
  
  var viewModel: UserViewModel!
  
  // Mark: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateView()
  }
  
  // MARK: - View Methods
  private func updateView() {
    self.firstNameTextField.text = viewModel.firstName
    self.lastNameTextField.text = viewModel.lastName
    self.emailTextField.text = viewModel.email
    self.passwordTextField.text = viewModel.password
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Actions
  @IBAction func save(_ sender: Any) {
    
  }
}
