//
//  ViewController.swift
//  SampleQuizApp
//
//  Created by 星享汰 on 2023/10/09.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tepSystemSound(_ sender: Any) {
        AudioServicesPlaySystemSoundWithCompletion(1000) {
        }
    }
    
    @IBAction func tapCustomSound(_ sender: Any) {
        let soundUrl = Bundle.main.url(forResource: "customSound", withExtension: "mp3")
        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundUrl! as CFURL, &soundId)
        AudioServicesPlaySystemSoundWithCompletion(soundId) {
        }
    }
    
    @IBAction func tapVibration(_ sender: Any) {
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate) {
        }
    }
    
    @IBAction func tapChangeShape(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        animation.fromValue = 0
        animation.toValue = 40
        animation.duration = 10
        targetView.layer.add(animation, forKey: "cornerRadius")
        targetView.layer.cornerRadius = 40
    }
    
}

