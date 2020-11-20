//
//  ViewController.swift
//  the Light
//
//  Created by Vlad Borovtsov on 20.11.2020.
//

import UIKit

class ViewController: UIViewController {

  var mode = 0;
  let colors = [
    UIColor.white,
    UIColor.red,
    UIColor.yellow,
    UIColor.green,
    UIColor.black
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }

  fileprivate func updateUI() {
    self.view.backgroundColor = colors[mode];
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    mode += 1;
    if mode == colors.count {
      mode=0;
    }
    updateUI();
  }
    
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
}

