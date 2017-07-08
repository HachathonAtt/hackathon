//
//  ViewController.swift
//  Demo
//
//  Created by Chengyu_Ovaltine on 7/7/17.
//  Copyright © 2017 Chengyu_Ovaltine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robot: UIImageView!
    @IBOutlet weak var open: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        robot.image = UIImage(named: MyGlobal.selectedImg)
        self.navigationController?.isNavigationBarHidden = true;
        if self.revealViewController() != nil {
            open.target = self.revealViewController()
            open.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
        UIImageView.animate(withDuration: 2, delay: 0.5,
                            usingSpringWithDamping: 0.67,
                            initialSpringVelocity: 0.1,
                            options: [], animations: {
            self.robot.center.y -= 400
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
