//
//  TrailerPlayer.swift
//  Demo
//
//  Created by Chengyu_Ovaltine on 7/8/17.
//  Copyright © 2017 Chengyu_Ovaltine. All rights reserved.
//

import UIKit
import YouTubePlayer

class TrailerPlayer: UIViewController {
    @IBOutlet weak var videoView: YouTubePlayerView!
    @IBOutlet weak var des: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.loadVideoID(MyGlobal.movieTrailer)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "batman_chat_bg.png")!)
        
        des.text = MyGlobal.movieDes
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
