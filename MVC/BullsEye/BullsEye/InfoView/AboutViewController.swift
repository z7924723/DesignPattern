//
//  AboutViewController.swift
//  BullsEye
//
//  Created by PinguMac on 2017/11/5.
//  Copyright © 2017年 PinguMac. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
  
  @IBOutlet weak var WebView: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    if let Url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
      if let HtmlData = try? Data(contentsOf: Url) {
        let BaseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
        WebView.load(HtmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: BaseUrl)
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func Close(){
    dismiss(animated: true, completion: nil)
  }

}
