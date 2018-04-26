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
    users.append(User(firstName: "Gavin", lastName: "Wu"))
    users.append(User(firstName: "avin", lastName: "Wu"))
    users.append(User(firstName: "vin", lastName: "Wu"))
    users.append(User(firstName: "in", lastName: "Wu"))
    
    return users
  }
  
}
