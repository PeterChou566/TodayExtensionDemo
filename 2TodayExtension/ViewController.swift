//
//  ViewController.swift
//  2TodayExtension
//
//  Created by 周大剛 on 2016/11/28.
//  Copyright © 2016年 周大剛. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // Create Music-Player
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func PLAY(_ sender: AnyObject) {
        
        player.play()
    }
    
    @IBAction func PAUSE(_ sender: AnyObject) {
        
        player.pause()
    }
    
    @IBAction func REPLAY(_ sender: AnyObject) {
        
        player.currentTime = 0
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            let audioPath = Bundle.main.path(forResource: "Song1", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath:audioPath!) as URL)
        }
        catch{
        // ERROR
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

