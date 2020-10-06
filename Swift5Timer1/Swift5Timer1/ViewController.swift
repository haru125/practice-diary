//
//  ViewController.swift
//  Swift5Timer1
//
//  Created by 太田都寿 on 2020/10/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArrey = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        count = 0
        
        stopButton.isEnabled = false
        
        for i in 0..<5 {
            
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArrey.append(image!)
        }
        
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate() {
        
        count = count + 1
        
        if count > 4 {
            
            count = 0
        }
        
        imageView.image = imageArrey[count]
    }
    
    
    @IBAction func start(_ sender: Any) {
        
        startTimer()
        
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
    }
    
    @IBAction func stop(_ sender: Any) {
        
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        
    }
}

