//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Lixiang Zhang on 11/22/20.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    internal var recordedAudioURL: URL!
    internal var audioFile:AVAudioFile!
    internal var audioEngine:AVAudioEngine!
    internal var audioPlayerNode: AVAudioPlayerNode!
    internal var stopTimer: Timer!

    private enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopAudio()
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
            }
        configureUI(.playing)
    }
    
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        stopAudio()
    }
}
