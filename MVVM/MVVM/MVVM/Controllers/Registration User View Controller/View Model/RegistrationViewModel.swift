//
//  RegistrationViewModel.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class RegistrationViewModel {
  var firstName: String
  var lastName: String
  var email: String
  var password: String
  
  init(firstName: String, lastName: String, email: String, password: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.password = password
  }
  
  func save() {
    let user = User(viewModel: self)
  }
}
