//
//  PeerInstance.swift
//  MultipeerRouting
//
//  Created by Vikram Grewal on 7/24/18.
//  Copyright © 2018 Vikram Grewal. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class PeerInstance  {
    var peerName : String?
    var peerId : MCPeerID?
    
    init(peerName : String) {
        self.peerName = peerName
        self.peerId = MCPeerID(displayName: peerName)
    }
}
