//
//  MultipeerSessionVC.swift
//  MultipeerRouting
//
//  Created by Vikram Grewal on 7/24/18.
//  Copyright © 2018 Vikram Grewal. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class MultipeerSessionVC: UIViewController {
    
    var multipeerAdvertiser : MCNearbyServiceAdvertiser?
    var multipeerBrowser : MCNearbyServiceBrowser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        multipeerBrowser?.delegate = self
        multipeerAdvertiser?.delegate = self
        
        startBrowsingAndAdvertising()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startBrowsingAndAdvertising()  {
        multipeerBrowser?.startBrowsingForPeers()
        multipeerAdvertiser?.startAdvertisingPeer()
    }
    
}

extension MultipeerSessionVC : MCNearbyServiceAdvertiserDelegate    {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
    }
    
}

extension MultipeerSessionVC : MCNearbyServiceBrowserDelegate   {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        let userName = peerID.displayName
        let alert = UIAlertController(title: "Found " + userName, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: nil, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        let userName = peerID.displayName
        let alert = UIAlertController(title: "Losthas " + userName, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: nil, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)    }
    
}

