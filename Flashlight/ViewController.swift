//
//  ViewController.swift
//  Flashlight
//
//  Created by Hin Wong on 2/24/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if onOff {
            return .darkContent
        } else {
            return .lightContent
        }
        
    }
    
    func toggleTorch(on:Bool) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }

            if device.hasTorch {
                do {
                    try device.lockForConfiguration()

                    if onOff == true {
                        device.torchMode = .on
                        print("flashlight on")
                    }
                    else {
                        device.torchMode = .off
                    }

                    device.unlockForConfiguration()
                }
                catch {
                    print("Torch could not be used")
                }
            }
            else {
                print("Torch is not available")
            }

        }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    var onOff = false
    
    @IBAction func tapGestureRecognized(_ sender: Any) {
        
           if onOff == false {
                view.backgroundColor = .white
                statusLabel.text = "OFF"
           }
            
            else {
                self.view.backgroundColor = .black
                statusLabel.text = "ON"
            }
                    
            onOff = !onOff
        
            setNeedsStatusBarAppearanceUpdate()
        toggleTorch(on: true)
        }
    
}








