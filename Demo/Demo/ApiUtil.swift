import Foundation
import TextToSpeechV1
import AVFoundation
import SpeechToTextV1

class ApiUtil {
    
    static let tts2 = TextToSpeech(username: "54a7ae25-1cad-4f00-b39b-1e0f47bc5226", password: "ZqChXtDo8qgn")
    
    static var audioPlayer = AVAudioPlayer() // see note below

    class func textToSpeech(_ text: String, callback: (() -> Void)? = nil) {
        let failure = { (error: Error) in print(error) }
        tts2.synthesize(text, failure: failure) { data in
            audioPlayer = try! AVAudioPlayer(data: data)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
    }
            
    class func setTimeout(_ delay:TimeInterval, block:@escaping ()->Void) -> Timer {
        return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
    }
    
}
