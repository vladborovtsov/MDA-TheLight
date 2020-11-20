//
//  ViewController.swift
//  the Light
//
//  Created by Vlad Borovtsov on 20.11.2020.
//

import UIKit
import AVKit

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
    toggleTorch(mode != colors.count-1) //torch should be on for any colors except black.
  }
  
  fileprivate func toggleTorch(_ on: Bool) {
    guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
    guard device.hasTorch else { return }
    
    do {
      try device.lockForConfiguration()
      
      if on {
        do {
          try device.setTorchModeOn(level: 1.0)
        } catch {
          print(error)
        }
      }
      else {
        device.torchMode = AVCaptureDevice.TorchMode.off
      }
      device.unlockForConfiguration()
    } catch {
      print(error)
    }
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

