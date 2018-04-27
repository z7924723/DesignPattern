//
//  User.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class User {
  
  var firstName :Dynamic<String>!
  var lastName :Dynamic<String>!
  var email :String!
  var password :String!
  
  init(firstName: String, lastName: String) {
    self.firstName = Dynamic<String>(firstName)
    self.lastName = Dynamic<String>(lastName)
  }

  init(viewModel: RegistrationViewModel) {
    self.firstName = viewModel.firstName
    self.lastName = viewModel.lastName
    self.email = viewModel.email
    self.password = viewModel.password
  }
}
