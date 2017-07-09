import Foundation
//import Alamofire
//import SwiftyJSON
import TextToSpeechV1
import AVFoundation
import SpeechToTextV1

class ApiUtil {
    
    static let tts2 = TextToSpeech(username: "f1540465-b78c-4e0c-be2c-3b37c8421905", password: "LlL2wQWaDTr7") //Allison
    
    static let player = Player()
    static let recorder = Recorder()

    class func textToSpeech(_ text: String, callback: (() -> Void)? = nil) {
        print("newTTS for \(text)")
        // GB_Kate US_Michael
        tts2.synthesize(text, voice: SynthesisVoice.us_Michael.rawValue, customizationID: nil, audioFormat: AudioFormat.wav,
                        failure: { error in
                            print("TTS error was generated \(error)")
        }) { data in
            self.player.playWaveData(data) { _ in
                print("new TTS done - now callback")
                callback?()
            }
            print("new TTS done for \(text)")
        }
    }
    
    /*
    class func getNetworkType()->String {
        do {
            let reachability:Reachability = try Reachability.reachabilityForInternetConnection()
            do{
                try reachability.startNotifier()
                let status = reachability.currentReachabilityStatus
                if(status == .NotReachable){
                    return ""
                }else if (status == .ReachableViaWiFi){
                    return "Wifi"
                }else if (status == .ReachableViaWWAN){
                    let networkInfo = CTTelephonyNetworkInfo()
                    let carrierType = networkInfo.currentRadioAccessTechnology
                    switch carrierType{
                    case CTRadioAccessTechnologyGPRS?,CTRadioAccessTechnologyEdge?,CTRadioAccessTechnologyCDMA1x?: return "2G"
                    case CTRadioAccessTechnologyWCDMA?,CTRadioAccessTechnologyHSDPA?,CTRadioAccessTechnologyHSUPA?,CTRadioAccessTechnologyCDMAEVDORev0?,CTRadioAccessTechnologyCDMAEVDORevA?,CTRadioAccessTechnologyCDMAEVDORevB?,CTRadioAccessTechnologyeHRPD?: return "3G"
                    case CTRadioAccessTechnologyLTE?: return "4G"
                    default: return ""
                    }
                    
                    // Get carrier name
                    
                }else{
                    return ""
                }
            }catch{
                return ""
            }
            
        }catch{
            return ""
        }
    }
    */
 
    class func speechToText(_ callback: @escaping (String, Bool) -> Void) {
        //recordToast()
        print("speech to text")
        recorder.watsonSTT(callback)
    }
        
    class func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    class func setTimeout(_ delay:TimeInterval, block:@escaping ()->Void) -> Timer {
        return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
    }
    
}
