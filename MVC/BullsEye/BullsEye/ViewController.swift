//
//  ViewController.swift
//  BullsEye
//
//  Created by PinguMac on 2017/11/1.
//  Copyright © 2017年 PinguMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var CurrentValue: Int = 0
  @IBOutlet weak var slider:UISlider!
  
  var TargetValue: Int = 0
  @IBOutlet weak var TargetLabel:UILabel!
  
  var Score: Int = 0
  @IBOutlet weak var ScoreLabel:UILabel!
  
  var Round: Int = 0
  @IBOutlet weak var RoundLabel:UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    let ThumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")  //UIImage(named: "SliderThumb-Normal")
    slider.setThumbImage(ThumbImageNormal, for: .normal)
    
    let ThumbImageHighLighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
    slider.setThumbImage(ThumbImageHighLighted, for: .highlighted)
    
    let Insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    let TrackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
    let TrackLeftResizeable = TrackLeftImage.resizableImage(withCapInsets: Insets)
    slider.setMinimumTrackImage(TrackLeftResizeable, for: .normal)
    
    let TrackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
    let TrackRightResizeable = TrackRightImage.resizableImage(withCapInsets: Insets)
    slider.setMaximumTrackImage(TrackRightResizeable, for: .normal)
    
    CurrentValue = lroundf(slider.value)
    
    let Number = [1, 2]
    let NumberSum = Number.reduce(0, {X, Y in
      X + X + Y
    })
    print(NumberSum)
    StartNewGame()
  }

  @IBAction func StartNewGame() {
    Score = 0
    Round = 0
    StartNewRound()
  }
  
  func UpdateLabel() {
    TargetLabel.text = String(TargetValue)
    ScoreLabel.text = String(Score)
    RoundLabel.text = String(Round)
  }
  
  func StartNewRound() {
    Round += 1
    TargetValue = 1 + Int(arc4random_uniform(UInt32(slider.maximumValue)))
    CurrentValue = Int(slider.maximumValue) / 2
    slider.value = Float(CurrentValue)
    
    UpdateLabel()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func SliderMoved(_ slider:UISlider){
    //print("The value of slider is now: \(slider.value)")
    CurrentValue = lroundf(slider.value)
  }
  
  @IBAction func showAlert() {
    let Difference: Int = abs(CurrentValue - TargetValue)
    let Point = lroundf(slider.maximumValue) - Difference
    
    Score += Point
    
    let Alert = UIAlertController(title: "You hits \(CurrentValue).", message: "You score: \(Score) points", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler:{
      action in
        self.StartNewRound()
    })
    
    Alert.addAction(action)
    
    present(Alert, animated: true, completion: nil)
  }
}
