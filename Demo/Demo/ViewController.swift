//
//  ViewController.swift
//  Demo
//
//  Created by Chengyu_Ovaltine on 7/7/17.
//  Copyright © 2017 Chengyu_Ovaltine. All rights reserved.
//

import UIKit
import SpeechToTextV1
import AVFoundation

class ViewController: UIViewController {
    // Watson Speech to Text Variables
    private var stt: SpeechToText?
    private var recorder: AVAudioRecorder?
    private var isStreamingDefault = false
    private var stopStreamingDefault: ((Void) -> Void)? = nil
    private var isStreamingCustom = false
    private var stopStreamingCustom: ((Void) -> Void)? = nil
    private var captureSession: AVCaptureSession? = nil
    

    @IBOutlet weak var robot: UIImageView!
    @IBOutlet weak var open: UIBarButtonItem!
    
    @IBAction func recordItemPressed(_ sender: Any) {
        NSLog("record item menu pressed")
        startStreaming()
    }
    private func startStreaming() {
        var settings = RecognitionSettings(contentType: .opus)
        settings.continuous = false
        settings.interimResults = true
        
        // ensure SpeechToText service is up
        guard let stt = stt else {
            print("SpeechToText not properly set up.")
            return
        }
        let failure = { (error: Error) in print(error) }
        stt.recognizeMicrophone(settings: settings, failure: failure) { results in
            NSLog("recognized: " + results.bestTranscript)
            let text = results.bestTranscript
            if text.contains("explosion") {
                NSLog("user is interested in explosion movies")
            }
//            self.inputToolbar.contentView.textView.text = results.bestTranscript
//            self.sendButton.isEnabled = true
            stt.stopRecognizeMicrophone()
//            self.microphoneButton.isEnabled = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "batman_chat_bg.png")!)
        
        robot.image = UIImage(named: MyGlobal.selectedImg)
        self.navigationController?.isNavigationBarHidden = true;
        if self.revealViewController() != nil {
            open.target = self.revealViewController()
            open.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        let user = "ee02e3e5-3eb2-465a-8950-d0554d5c0d38"
        let password = "FBQSTGVRKLrK"
        stt = SpeechToText(username: user, password: password)
        
        UIImageView.animate(withDuration: 2, delay: 0.5,
                            usingSpringWithDamping: 0.67,
                            initialSpringVelocity: 0.1,
                            options: [], animations: {
            self.robot.center.y -= 400
            ApiUtil.textToSpeech("Welcome to our app")
        },completion:nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    private func launchAnimation() {
//        let vc = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "launch")
//        let launchview = vc.view
//        let delegate = UIApplication.shared.delegate
//        let mainWindow = delegate?.window
//        mainWindow!!.addSubview(launchview!)
//        
//        UIView.animate(withDuration: 1, delay: 0.5, options: .beginFromCurrentState,
//                                       animations: {
//                                        launchview?.alpha = 0.0
//                                        launchview?.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.0)
//            }) { (finished) in
//                launchview?.removeFromSuperview()
//            }
//    }


}
