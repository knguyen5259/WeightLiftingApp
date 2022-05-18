//
//  FifthViewController.swift
//  WeightLiftApp
//
//  Created by Keenan Nguyen on 5/16/22.
//

import SafariServices
import UIKit
import WebKit

class FifthViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var link = ""

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string:link)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
