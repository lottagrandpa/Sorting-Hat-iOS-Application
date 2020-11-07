//
//  WebViewController.swift
//  CustomTableTest
//
//  Created by 张佳盈 on 2020/2/29.
//  Copyright © 2020 lottagrandpa. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var urlString: String!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the web content 1) url 2) urlrequest 3) load url
        let url = NSURL(string: urlString)
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
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
