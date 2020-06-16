//
//  InitialViewController.swift
//  Project4
//
//  Created by Peter Romachov on 10/6/20.
//  Copyright © 2020 Peter Romachov. All rights reserved.
//

import UIKit

class InitialViewController: UITableViewController{
    let websites = ["apple.com", "google.com", "wikipedia.org"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Navigation System"
        navigationController?.navigationBar.prefersLargeTitles = true        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = "Go to \(websites[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as? WebViewController{
            vc.websites = websites
            vc.website = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
