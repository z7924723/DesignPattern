//
//  UserDefault.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/27.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

extension UserDefaults {
  enum Keys {
    static let secure = "secure"
  }
  
  // MARK: - Secure Option
  static func secureIsOpen() -> Bool {
    let storedValue = UserDefaults.standard.bool(forKey: UserDefaults.Keys.secure)
    return storedValue
  }
  
  static func setSecureValue(switchOption: Bool) {
    UserDefaults.standard.set(switchOption, forKey: UserDefaults.Keys.secure)
  }
}
