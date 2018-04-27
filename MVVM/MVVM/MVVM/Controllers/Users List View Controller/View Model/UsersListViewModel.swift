//
//  UsersListViewModel.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class UsersListViewModel {
  var userViewModels: [UserViewModel] = [UserViewModel]()
  private var dataAccess: DataAccess
  
  init(dataAccess: DataAccess) {
    self.dataAccess = dataAccess
    
    populateUsers()
  }

  private func populateUsers() {
    let users = self.dataAccess.getAllUsers()
    self.userViewModels = users.map { (user) in
      return UserViewModel(user: user)
    }
  }
}

class UserViewModel {
  var firstName: Dynamic<String>!
  var lastName: Dynamic<String>!
  var email: String!
  var password: String!
  
  init(user: User) {
    self.firstName = user.firstName
    self.lastName = user.lastName
    self.email = user.email
    self.password = user.password
  }
}
