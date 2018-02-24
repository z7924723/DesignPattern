//
// Created by PinguMac on 2018/2/6.
// Copyright (c) 2018 PinguMac. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateLabelDataSource: class {
  func updateScore(score: Int)
  func updateRound(round: Int)
  func updateTarget(target: Int)
}

class GameControl {
  var sliderCurVal: Int  // slider current value
  var targetVal: Int     // the target user must hit
  var score: Int
  var round: Int
  let maxSliderVal: Int
  
  weak var delegate: UpdateLabelDataSource?
  
  init() {
    sliderCurVal = 50
    targetVal = 0
    score = 0
    round = 0
    maxSliderVal = 100
  }
  
  func newGame() {
    score = 0
    round = 0
    
    StartNewRound()
  }
  
  func StartNewRound() {
    round += 1
    targetVal = 1 + Int(arc4random_uniform(UInt32(maxSliderVal)))
    
    UpdateLabel()
  }
  
  func UpdateLabel() {
    delegate?.updateScore(score: score)
    delegate?.updateRound(round: round)
    delegate?.updateTarget(target: targetVal)
  }
}
