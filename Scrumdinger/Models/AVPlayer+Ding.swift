

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        let url = URL(filePath: "/Users/hamihash/Desktop/Scrumdinger/Scrumdinger/sound/ding.wav")
        return AVPlayer(url: url)
    }()
}

