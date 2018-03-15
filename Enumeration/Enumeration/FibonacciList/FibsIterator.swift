//
//  FibonacciList.swift
//  Enumeration
//
//  Created by PinguMac on 2018/1/30.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct FibIterator: IteratorProtocol {
  var state = (0, 1)
  mutating func next() -> Int? {
    let nextValue = state.1
    defer {
      state = (state.1, state.0 + state.1)
    }
    
    return nextValue
  }
}

struct Fibonacci: Sequence {
  func makeIterator() -> FibIterator {
    return FibIterator()
  }
}