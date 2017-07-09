//
//  Recommendation.swift
//  Demo
//
//  Created by Chengyu_Ovaltine on 7/9/17.
//  Copyright © 2017 Chengyu_Ovaltine. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Recommendation: UIViewController {
    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    @IBOutlet weak var third: UIButton!
    
    @IBAction func firstClick(_ sender: Any) {
        MyGlobal.movieDes = self.dess[0]
        MyGlobal.movieTrailer = self.trailers[0]
        performSegue(withIdentifier: "recommendTrailer", sender: nil)
    }
    @IBAction func secondClick(_ sender: Any) {
        MyGlobal.movieDes = self.dess[1]
        MyGlobal.movieTrailer = self.trailers[1]
        performSegue(withIdentifier: "recommendTrailer", sender: nil)
    }
    @IBAction func thirdClick(_ sender: Any) {
        MyGlobal.movieDes = self.dess[2]
        MyGlobal.movieTrailer = self.trailers[2]
        performSegue(withIdentifier: "recommendTrailer", sender: nil)
    }
    
    var trailers:[String] = []
    var dess:[String] = []
    
    override func viewDidLoad() {
        let temp = MyGlobal.recommendation
        super.viewDidLoad()
        first.isHidden=true
        second.isHidden=true
        third.isHidden=true
        self.first.setImage(UIImage(named:"chicken.jpg"), for: .normal)
        Alamofire.request("http://10.64.3.5:8888/genre/" + temp + "/3").responseJSON { response in
            if let resultValue = response.result.value {
                
                let jsonRes = JSON(resultValue)
                
                self.trailers.append(jsonRes[0]["trailer_link"].rawString()!)
                self.trailers.append(jsonRes[1]["trailer_link"].rawString()!)
                self.trailers.append(jsonRes[2]["trailer_link"].rawString()!)
                
                self.dess.append(jsonRes[0]["overview"].rawString()!)
                self.dess.append(jsonRes[1]["overview"].rawString()!)
                self.dess.append(jsonRes[2]["overview"].rawString()!)
                
                if let url = NSURL(string: jsonRes[0]["img_link"].rawString()!){
                    if let data = NSData(contentsOf: url as URL){
                            self.first.setImage(UIImage(data: data as Data), for: .normal)
                    }
                }
                self.first.isHidden=false
                if let url = NSURL(string: jsonRes[1]["img_link"].rawString()!){
                    if let data = NSData(contentsOf: url as URL){
                        self.second.setImage(UIImage(data: data as Data), for: .normal)
                    }
                }
                self.second.isHidden=false
                if let url = NSURL(string: jsonRes[2]["img_link"].rawString()!){
                    if let data = NSData(contentsOf: url as URL){
                        self.third.setImage(UIImage(data: data as Data), for: .normal)
                    }
                }
                self.third.isHidden=false
            }
            
        }
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
