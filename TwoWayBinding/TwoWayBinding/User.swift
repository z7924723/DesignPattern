//
//  User.swift
//  MVVM
//
//  Created by PinguMac on 2018/2/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct User {
//  var name: String
  var name: Observable<String>
}

class Observable <ObservedType> {
  private var _value: ObservedType?
  
  init(_ inputVal: ObservedType) {
    _value = inputVal
  }
  
  var valueChanged: ((ObservedType?) -> ())?
  
  public var value: ObservedType? {
    get {
      return _value
    }
    
    set {
    _value = newValue
    valueChanged?(_value)
    }
  }

  func bindingChanged(to newValue: ObservedType) {
    _value = newValue
    print("Value is now \(newValue)")
  }

}

