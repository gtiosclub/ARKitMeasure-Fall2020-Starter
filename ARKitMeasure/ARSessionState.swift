//
//  ARSessionState.swift
//  AR Measure
//
//  Created by Phil Zakharchenko on 26/06/18.
//  Copyright © 2018 Phil Zakharchenko. All rights reserved.
//

import Foundation
enum ARSessionStateStatus {
    case initialized
    case ready
    case temporarilyUnAvailable
    case failed
    
    var statusDescription: String {
        switch self {
        case .initialized:
            return " Session is initialized. Keep moving around"
        case .ready:
            return " Session is ready. Tap to start measuring"
        case .temporarilyUnAvailable:
            return " Session is temporarily unavailable..."
        case .failed:
            return " Session failed"
        }
        
    }
}
