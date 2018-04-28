//
//  RegistrationViewModel.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class Dynamic<T> {
  typealias Listener = (T) -> Void
  var listener: Listener?

  var value: T? {
    didSet {
      listener?(value!)
    }
  }

  init(_ actualValue: T) {
    self.value = actualValue
  }

  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value!)
  }
}

class RegistrationViewModel: BrokenRuleProtocol {
  // MARK: - Broken Rule Protocol Properties
  var brokenRules: [BrokenRule] = [BrokenRule]()
  var isVaild: Bool {
    get {
      self.brokenRules = [BrokenRule]()
      self.validate()
      return self.brokenRules.count == 0 ? true : false
    }
  }
  
  // MARK: - User Registration Properties
  var firstName: Dynamic<String>!
  var lastName: Dynamic<String>!
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

extension RegistrationViewModel {
  private func validate() {
    if email.isEmpty {
      self.brokenRules.append(BrokenRule(propertyName: "email", message: "Require email"))
    }
    
    if password.isEmpty {
      self.brokenRules.append(BrokenRule(propertyName: "password", message: "Request password"))
    }
  }
}
