//
//  SettingViewController.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/27.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {
  
  // MARK: - Porperties
  @IBOutlet weak var secureSwitch: UISwitch!
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Setting"
  }
  
  // MARK： - Configure Methods
  private func configure() {
    if UserDefaults.secureIsOpen() {
      secureSwitch.setOn(true, animated: false)
    } else {
      secureSwitch.setOn(false, animated: false)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // Mark: - Actions
  @IBAction func switchOnChanged(_ sender: Any) {
    if secureSwitch.isOn {
      UserDefaults.setSecureValue(switchOption: true)
    } else {
      UserDefaults.setSecureValue(switchOption: false)
    }
  }
}
