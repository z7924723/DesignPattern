//
//  Node.swift
//  Enumeration
//
//  Created by PinguMac on 2018/1/30.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class Node<T> {
  var value: T
  var next: Node?
  
  init(value: T) {
    self.value = value
  }
}
