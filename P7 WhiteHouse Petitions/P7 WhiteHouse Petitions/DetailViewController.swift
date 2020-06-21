//
//  DetailViewController.swift
//  P7 WhiteHouse Petitions
//
//  Created by Peter Romachov on 19/6/20.
//  Copyright © 2020 Peter Romachov. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        

        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, intial-scale=1">
        <style> body { font-size: 150%; font-family:"Proxima Nova", "Helvetica Neue"} </style>
        </head>
        <body>
        <b>\(detailItem.title)</b>
        <br>
        <hr>
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
