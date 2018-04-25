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
  
  var registrationViewMode: RegistrationViewModel!
  
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
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    self.registrationViewMode = RegistrationViewModel(firstName: firstNameTextField.text!,
                                                      lastName: lastNameTextField.text!,
                                                      email: emailTextField.text!,
                                                      password: passwordTextField.text!)
    registrationViewMode.save(userViewModel: viewModel)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
}
