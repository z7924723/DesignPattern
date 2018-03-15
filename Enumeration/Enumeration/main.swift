//
//  main.swift
//  Enumeration
//
//  Created by PinguMac on 2018/1/30.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

let list   = SingleLinkedList<Int>()
let first  = Node(value: 1)
let second = Node(value: 1)
let third  = Node(value: 2)
let fourth = Node(value: 3)
let fifth  = Node(value: 5)
var sixth  = Node(value: 8)
let seven  = Node(value: 13)
// NSSet -> NSFastEnumeration -> NSEnumerator -> Sequence

//list.start  = first
//first.next  = second
//second.next = third
//third.next  = fourth
//fourth.next = fifth
//fifth.next  = sixth
//sixth.next  = seven

print("Single Linked List:")
// Single Linked List calling method 1
for node in list {
  print(node.value)
}

// Single Linked List calling method 2
//var iterator = list.makeIterator()
//while let node = iterator.next() {
//  print(node.value)
//}

print("Fibonacci List:")
// Fibonacci List calling method 1
//let fibs = FibsList()
// Fibonacci List calling method 2
let fibs = Fibonacci()

var count = 0
//for fib in fibs {
//  print(fib)
//
//  count += 1
//  if count == 25 {
//    break
//  }
//}

// Fibonacci List calling method 3
var fibIterator = fibs.makeIterator()
while let value = fibIterator.next() {
  print(value)
  
  count += 1
  if count == 25 {
    break
  }
}
