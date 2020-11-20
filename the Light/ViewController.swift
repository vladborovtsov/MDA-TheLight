//
//  ViewController.swift
//  the Light
//
//  Created by Vlad Borovtsov on 20.11.2020.
//

import UIKit

class ViewController: UIViewController {

  var isLightOn: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }

  fileprivate func updateUI() {
    self.view.backgroundColor = isLightOn ? .white : .black
  }
  
  @IBAction func buttonPressed() {
    isLightOn.toggle();
    updateUI();
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
}

