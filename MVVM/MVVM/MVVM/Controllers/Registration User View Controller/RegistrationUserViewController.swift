//
//  RegistrationUserViewController.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit
import LocalAuthentication

class RegistrationUserViewController: UIViewController {
  
  // MARK: - Porperties
  @IBOutlet weak var lockView: UIView!
  
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
  var dataIsLock: Bool! = true
  
  // MARK: - View Life Cycle
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
    if UserDefaults.secureIsOpen() == false {
      lockView.isHidden = true
      self.navigationItem.rightBarButtonItems![1].image = UIImage(named: "unlock.png")
    }
    
    self.viewModel.firstName.bind { (firstName) in
      self.firstNameLabel.text = firstName
    }
    
    self.viewModel.lastName.bind { (lastName) in
      self.lastNameLabel.text = lastName
    }
    
    self.emailTextField.text = viewModel.email
    self.passwordTextField.text = viewModel.password
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    registrationViewModel.save(userViewModel: viewModel)
  }
  
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    
    registrationViewModel.email = emailTextField.text!
    registrationViewModel.password = passwordTextField.text!
    
    if registrationViewModel.isVaild {
      return true
    } else {
     return false
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func authCheck(_ sender: Any) {
    let laContext: LAContext = LAContext()
    
    if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
      laContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Unlock with finger print") { (wasCorrect, error) in
        if wasCorrect {
          DispatchQueue.main.async {
            self.dataIsLock = false
            self.lockView.isHidden = true
            self.navigationItem.rightBarButtonItems![1].image = UIImage(named: "unlock.png")
          }
        } else {
          print(error.debugDescription)
          return
        }
      }
    } else {
      print("not support touch id")
    }
  }
  
  @IBAction func lockDidTapped(_ sender: Any) {
    guard dataIsLock == true else {
      self.dataIsLock = true
      self.navigationItem.rightBarButtonItems![1].image = UIImage(named: "lock.png")
      self.lockView.isHidden = false
      
      UserDefaults.setSecureValue(switchOption: true)
      return
    }
    authCheck(dataIsLock)
  }
}

