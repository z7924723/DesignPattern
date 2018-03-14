//
//  ViewController.swift
//  TwoWayBinding
//
//  Created by PinguMac on 2018/2/24.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var userName: BoundTextField!
  
  var user = User(name: Observable("Gavin"))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    userName.bind(to: user.name)

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      self.user.name.value = "aaaaa"
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

