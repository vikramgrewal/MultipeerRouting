//
//  MultipeerSessionContainerVC.swift
//  MultipeerRouting
//
//  Created by Vikram Grewal on 7/25/18.
//  Copyright © 2018 Vikram Grewal. All rights reserved.
//

import UIKit

class MultipeerSessionContainerVC: UIViewController {
    
    @IBOutlet weak var segmentedView: UIView!
    var sessionVCView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViews()   {
    
        if let sessionVC = childViewControllers[0] as? MultipeerSessionVC  {
            sessionVCView = sessionVC.view
            segmentedView.addSubview(sessionVC.view)
            
            sessionVC.view.frame = segmentedView.bounds
            sessionVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            sessionVC.didMove(toParentViewController: self)
        }
        
        if let sessionFriendsVC = childViewControllers[1] as? mult
        
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
