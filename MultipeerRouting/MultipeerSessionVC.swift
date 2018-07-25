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
    
    // Outlets
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var discoverySwitch: UISwitch!
    
    var multipeerAdvertiser : MCNearbyServiceAdvertiser?
    var multipeerBrowser : MCNearbyServiceBrowser?
    
    var users : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        multipeerBrowser?.delegate = self
        multipeerAdvertiser?.delegate = self
    
        setUsers()
        setTableView()
        setDiscoverySwitch()
        
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
    
    func stopBrowsingAndAdvertisting()  {
        multipeerBrowser?.stopBrowsingForPeers()
        multipeerAdvertiser?.stopAdvertisingPeer()
        
        
    }
    
    func setUsers() {
        users = [String]()
    }
    
    func setDiscoverySwitch()   {
        discoverySwitch.addTarget(self, action: #selector(switchChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        
        if !value    {
            stopBrowsingAndAdvertisting()
        }   else    {
            startBrowsingAndAdvertising()
        }
    }
    
}

extension MultipeerSessionVC : MCNearbyServiceAdvertiserDelegate    {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
    }
    
}

extension MultipeerSessionVC : MCNearbyServiceBrowserDelegate   {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        let userName = peerID.displayName
        
        insertUser(userName: userName)
        
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        let userName = peerID.displayName
        
        removeUser(userName: userName)
    }
    
    func insertUser(userName : String)  {
        
        guard !users.contains(userName) else {
            return
        }
        
        users.append(userName)
        
        usersTableView.reloadData()
    }
    
    func removeUser(userName : String)  {
        
        guard let userIndex = users.index(of: userName) else {
            return
        }
        
        users.remove(at: userIndex)
        
        usersTableView.reloadData()
    }
    
}

extension MultipeerSessionVC : UITableViewDelegate, UITableViewDataSource   {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = users[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func setTableView() {
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        usersTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

