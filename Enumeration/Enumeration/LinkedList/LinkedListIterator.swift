//
//  ListIterator.swift
//  Enumeration
//
//  Created by PinguMac on 2018/1/30.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class LinkListIterator<T>: IteratorProtocol {
  var current: Node<T>?
  
  init(start: Node<T>?) {
    current = start
  }
  
  func next() -> Node<T>? {
    // Return current first, then point to next and return it.
    defer { current = current?.next }
    return current
  }
}

extension SingleLinkedList: Sequence {
  func makeIterator() -> LinkListIterator<T> {
    return LinkListIterator(start: start)
  }
}
