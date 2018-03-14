//
//  User.swift
//  TwoWayBinding
//
//  Created by PinguMac on 2018/3/14.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

//struct User {
//  var name: String
//}

struct User {
  var name: Observable<String>
}

class Observable<ObservedType> {
  
  // MARK: - Porperties
  private var _value: ObservedType?
  
  public var value: ObservedType? {
    set {
      _value = newValue
      valueChanged?(_value)
    }
    
    get {
      return _value
    }
  }
  
  // MARK: -
  init(_ value: ObservedType) {
    self._value = value
  }
  
  var valueChanged: ((ObservedType?) -> ())?
  
  // MARK: -
  func bindingChanged(to newValue: ObservedType) {
    _value = newValue
    print("Value is now \(newValue)")
  }
  
}

class BoundTextField: UITextField {
  var changedClosure: (() -> ())?
  
  func bind(to observable: Observable<String>) {
    addTarget(self,
              action: #selector(BoundTextField.valueChanged),
              for: .editingChanged)
    
    changedClosure = { [weak self] in
      observable.bindingChanged(to: self?.text ?? "")
    }
    
    observable.valueChanged = { [weak self] (newValue) in
      self?.text = newValue
    }
  }
  
  @IBAction func valueChanged() {
    changedClosure?()
  }
}
