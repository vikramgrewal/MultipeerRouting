//
//  MultipeerSessionFriendsVC.swift
//  MultipeerRouting
//
//  Created by Vikram Grewal on 7/25/18.
//  Copyright © 2018 Vikram Grewal. All rights reserved.
//

import UIKit

class MultipeerSessionFriendsVC: UIViewController {
    
    var friends : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFriends()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setFriends()   {
        friends = [String]()
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

extension MultipeerSessionFriendsVC : UITableViewDelegate, UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = friends[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
