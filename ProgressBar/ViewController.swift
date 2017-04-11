//
//  ViewController.swift
//  ProgressBar
//
//  Created by Michael Wood on 4/10/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count: Float = 0.0
    var min: Float = 0.0
    var max: Float = 1.0
    var int: Float = 0.1
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var theButton: UIButton!
    
    @IBAction func toggleProgressBar(_ sender: UIButton) {
        if theButton.title(for: .normal) == "Start" || theButton.title(for: .normal) == "Resume" {
            theButton.setTitle("Pause", for: .normal)
            max = 1.0
            startProgress()
        } else {
            theButton.setTitle("Resume", for: .normal)
            stopProgress()
        }
    }
    
    func startProgress() {
        DispatchQueue.global(qos: .userInitiated).async {
            while self.count <= self.max {
                DispatchQueue.main.async {
                    self.progressBar.setProgress(self.count, animated: true)
                }
                self.count += self.int
                
                if Int(self.count) == Int(self.max) {
                    DispatchQueue.main.async {
                        self.theButton.setTitle("Start", for: .normal)
                        self.count = self.min
                        self.progressBar.setProgress(self.min, animated: true)
                    }
                } else {
                    sleep(1)
                }
            }
            
        }
    }
    
    func stopProgress() {
        max = -1.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

