//
//  TodayViewController.swift
//  TodayExtTaget
//
//  Created by 周大剛 on 2016/11/28.
//  Copyright © 2016年 周大剛. All rights reserved.
//

import UIKit
import NotificationCenter
import AVFoundation

class TodayViewController: UIViewController, NCWidgetProviding {
   var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var MusicLbl: UIButton!
    @IBOutlet weak var HelloLabel: UILabel!
    
   @IBAction func MusicButton(_ sender: AnyObject) {
        if player.isPlaying == true{
            player.pause()
            MusicLbl.setTitle("Music🔕", for: .normal)
        }else{
            player.play()
            MusicLbl.setTitle("Music🔔", for: .normal)
        }
    }
    
    
    func doLaunchApp(){
        if let url = NSURL(string: "TodayExtTarget://"){
            self.extensionContext?.open(url as URL, completionHandler: nil)
            print("///////////----------")
        }
        print("NNNNNNNNNNN")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Insert music
        
        do{
            let audioPath = Bundle.main.path(forResource: "Song1", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath:audioPath!) as URL)
        }
        catch{
            // ERROR
        }
        
        // Enter App UIView
        HelloLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TodayViewController.doLaunchApp))
        HelloLabel.addGestureRecognizer(tapGesture)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
