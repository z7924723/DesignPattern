//
//  File.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/28.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct BrokenRule {
  // MARK: - Properties
  var propertyName: String
  var message: String
}

protocol BrokenRuleProtocol {
  var brokenRules: [BrokenRule] { get set }
  var isVaild: Bool { get }
}
