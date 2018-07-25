//
//  ViewController.swift
//  MultipeerRouting
//
//  Created by Vikram Grewal on 7/24/18.
//  Copyright © 2018 Vikram Grewal. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class MultipeerInitialVC: UIViewController {

    @IBOutlet weak var displayName: UITextField!
    @IBOutlet weak var advertiserName: UITextField!
    @IBOutlet weak var startMultipeerDiscovery: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setDelegates()
        
        setActions()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDelegates() {
        displayName.delegate = self
    }
    
    func setActions()   {
        startMultipeerDiscovery.addTarget(self, action: #selector(presentMultipeerSessionVC), for: .touchDown)
    }
    
    
    @objc func presentMultipeerSessionVC()    {
        
        guard let displayNameText = displayName.text, !(displayName.text?.isEmpty)! else {
            return
        }
        
        guard let advertiserNameText = advertiserName.text, !(advertiserName.text?.isEmpty)! else {
            return
        }
        
        DispatchQueue.main.async {
            
            let multipeerSessionVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "multipeerSessionVC") as! MultipeerSessionVC
            
            let mcPeerId = MCPeerID(displayName: displayNameText)
            
            let multipeerAdvertiser = MCNearbyServiceAdvertiser(peer: mcPeerId, discoveryInfo: nil, serviceType: advertiserNameText)
            
            multipeerSessionVC.multipeerAdvertiser = multipeerAdvertiser
            
            let multipeerBrowser = MCNearbyServiceBrowser(peer: mcPeerId, serviceType: advertiserNameText)
            
            multipeerSessionVC.multipeerBrowser = multipeerBrowser
            
            let multipeerSessionContainerVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "multipeerSessionContainerVC") as! MultipeerSessionContainerVC
            
            multipeerSessionContainerVC.addChildViewController(multipeerSessionVC)
            
            self.present(multipeerSessionContainerVC, animated: true, completion: nil)
            
        }
    }
}

extension MultipeerInitialVC : UITextFieldDelegate   {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}

