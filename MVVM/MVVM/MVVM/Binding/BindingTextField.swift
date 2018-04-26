//
//  BindingTextField.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class BindingTextField: UITextField {
  var textChanged: (String) -> () = { _ in }
  
  func bind(callback: @escaping (String) -> ()) {
    self.textChanged = callback
    
    self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
  }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    self.textChanged(textField.text!)
  }
}
