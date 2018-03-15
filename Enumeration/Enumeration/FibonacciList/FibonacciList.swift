//
//  FibonacciList.swift
//  Enumeration
//
//  Created by PinguMac on 2018/1/30.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct FibsList {
  var previous: Int = 0
  var current: Int = 1
}

extension FibsList: Sequence, IteratorProtocol {
  mutating func next() -> Int? {
    defer {
      let next = previous + current
      previous = current
      current = next
    }
    return current
  }
}
