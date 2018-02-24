//
//  ViewController.swift
//  BullsEye
//
//  Created by PinguMac on 2017/11/1.
//  Copyright © 2017年 PinguMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let gameControl = GameControl()
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    
    var tableView = UITableView()
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
    
    gameControl.delegate = self
    gameControl.newGame()
  }

  // press reset will start new game
  @IBAction func restartGame() {
    gameControl.newGame()
    resetSlider(slider)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func SliderMoved(_ slider: UISlider){
    gameControl.sliderCurVal = lroundf(slider.value)
  }
  
  // Hit me button
  @IBAction func showAlert() {
    let difference: Int = abs(gameControl.sliderCurVal - gameControl.targetVal)
    let point = lroundf(slider.maximumValue) - difference

    gameControl.score += point

    let Alert = UIAlertController(title: "You hits \(gameControl.sliderCurVal).", message: "You score: \(gameControl.score) points", preferredStyle: .alert)

    let action = UIAlertAction(title: "OK", style: .default, handler:{
      action in
      self.gameControl.StartNewRound()
      self.resetSlider(self.slider)
    })

    Alert.addAction(action)

    present(Alert, animated: true, completion: nil)
  }
  
  func resetSlider(_ slider: UISlider) {
    let sliderCurVal = Int(slider.maximumValue) / 2
    slider.value = Float(sliderCurVal)
  }
}

extension ViewController: UpdateLabelDataSource {
  func updateScore(score: Int) {
    scoreLabel.text = String(score)
  }
  
  func updateRound(round: Int) {
    roundLabel.text = String(round)
  }
  
  func updateTarget(target: Int) {
    targetLabel.text = String(target)
  }
}
