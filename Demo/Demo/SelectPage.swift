//
//  SelectPage.swift
//  Demo
//
//  Created by Chengyu_Ovaltine on 7/8/17.
//  Copyright © 2017 Chengyu_Ovaltine. All rights reserved.
//

import UIKit

struct MyGlobal {
    static var selectedImg = "chicken.jpg";
    static var movieTrailer = "http://i1.wp.com/image.tmdb.org/t/p/w600/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg";
    static var movieDes = "This is description"
    static var recommendation = "action"
}

class SelectPage: UIViewController {

    @IBAction func firstImg(_ sender: Any) {
        MyGlobal.selectedImg = "chicken.jpg"
    }
    
    @IBAction func secondImg(_ sender: Any) {
        MyGlobal.selectedImg = "batman.png"
    }
    
    @IBAction func thirdImg(_ sender: Any) {
        MyGlobal.selectedImg = "robot.jpg"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
