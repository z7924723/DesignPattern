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
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  @IBOutlet weak var emailTextField: BindingTextField! {
    didSet {
      emailTextField.bind { (email) in
        self.registrationViewModel.email = email
      }
    }
  }
  
  @IBOutlet weak var passwordTextField: BindingTextField! {
    didSet {
      passwordTextField.bind { (password) in
        self.registrationViewModel.password = password
      }
    }
  }
  
  var viewModel: UserViewModel!
  
  var registrationViewModel: RegistrationViewModel!
  
  // Mark: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureData()
    
    updateView()
  }
  
  // MARK: - Configure Methods
  private func configureData() {
    self.registrationViewModel = RegistrationViewModel(viewModel: viewModel)
  }
  
  // MARK: - View Methods
  private func updateView() {
    self.firstNameLabel.text = viewModel.firstName
    self.lastNameLabel.text = viewModel.lastName
    self.emailTextField.text = viewModel.email
    self.passwordTextField.text = viewModel.password
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print(self.registrationViewModel)

    registrationViewModel.save(userViewModel: viewModel)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
}
