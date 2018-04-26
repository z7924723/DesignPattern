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
  var email: String!
  var password: String!
  
  init(viewModel: UserViewModel) {
    self.firstName = viewModel.firstName
    self.lastName = viewModel.lastName
  }
  
  func save(userViewModel: UserViewModel) {
    userViewModel.firstName = self.firstName
    userViewModel.lastName = self.lastName
    userViewModel.email = self.email
    userViewModel.password = self.password
  }
}
