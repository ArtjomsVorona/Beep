//
//  ViewController.swift
//  Beep
//
//  Created by Artjoms Vorona on 08/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var player = AVPlayer()
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlay), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        playButton.tintColor = .systemBlue
    }

    @IBAction func beepPressed(_ sender: UIButton) {
        if player.timeControlStatus == .playing {
            player.pause()
            playButton.setTitle("Play", for: .normal)
        } else {
            let url = Bundle.main.url(forResource: "trumpet", withExtension: "mp3")
            player = AVPlayer(url: url!)
            player.play()
            playButton.setTitle("STOP", for: .normal)
        }
    }
    
    @objc func playerDidFinishPlay() {
        playButton.setTitle("Play", for: .normal)
    }
    
}

