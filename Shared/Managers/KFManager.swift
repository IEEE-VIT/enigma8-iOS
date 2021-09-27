//
//  KFManager.swift
//  Enigma
//
//  Created by Aaryan Kothari on 27/09/21.
//

import Kingfisher
import UIKit

class KFManager {
    
    static var defaultOptions: KingfisherOptionsInfo {
        get {
            return [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        }
    }
    
    class func configure() {
        let cache = ImageCache.default
        // Limit memory cache size to 100 MB.
        cache.memoryStorage.config.totalCostLimit = 100 * 1024 * 1024
        // Memory image expires after 30 minutes.
        cache.memoryStorage.config.expiration = .seconds(30 * 60)
        // Disk image never expires.
        cache.diskStorage.config.expiration = .never
    }
    
    class func clean() {
        KingfisherManager.shared.cache.clearCache()
    }
    
    class func parseResult(_ result: Result<RetrieveImageResult, KingfisherError>) -> Bool {
        switch result {
        case .success(_):
            return true
        case .failure(let error):
            Logger.verbose("Image download job failed: \(error.localizedDescription)")
            return false
        }
    }
    
}
