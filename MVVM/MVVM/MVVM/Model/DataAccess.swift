//
//  DataAccess.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class DataAccess {
  
  func getAllUsers() -> [User] {
    var users = [User]()
    users.append(User(firstName: "Gavin", lastName: "Wu", email: "asd@gmail.com", password: "123"))
    users.append(User(firstName: "avin", lastName: "Wu", email: "asdf@gmail.com", password: "1234"))
    users.append(User(firstName: "vin", lastName: "Wu", email: "asdg@gmail.com", password: "12345"))
    users.append(User(firstName: "in", lastName: "Wu", email: "asdh@gmail.com", password: "123456"))
    
    return users
  }
  
}
