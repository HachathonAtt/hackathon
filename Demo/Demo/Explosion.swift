//
//  Explosion.swift
//  Demo
//
//  Created by Chengyu_Ovaltine on 7/8/17.
//  Copyright © 2017 Chengyu_Ovaltine. All rights reserved.
//

import UIKit

class Explosion: UIViewController {
    
    @IBOutlet weak var explosion: UIImageView!
    
    var count = 1
    var timer = Timer()
    
    func animator() {
        explosion.image = UIImage(named: "frame_\(count)_delay-0.06s.gif")
        count += 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 0.09, target: self, selector: #selector(Explosion.animator), userInfo: nil, repeats: true)
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
