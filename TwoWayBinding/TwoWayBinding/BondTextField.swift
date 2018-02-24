//
//  BondTextField.swift
//  MVVM
//
//  Created by PinguMac on 2018/2/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation
import UIKit

class BoundTextField: UITextField {
  var changedClosure: (() -> ())?
  
  @IBAction func valueChanged() {
    changedClosure?()
  }
  
  func bind(to observable: Observable<String>) {
    addTarget(self, action: #selector(BoundTextField.valueChanged), for: .editingChanged)
    
    changedClosure = { [weak self] in
      observable.bindingChanged(to: self?.text ?? "")
    }
    
    observable.valueChanged = { [weak self] newValue in
      self?.text = newValue
    }
  }
}
