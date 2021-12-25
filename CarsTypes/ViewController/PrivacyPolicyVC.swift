//
//  PrivacyPolicyVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 21/12/2021.
//

import UIKit
import WebKit
//import SVProgressHUD


class PrivacyPolicyVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        initializeView()
    }
    
    private func initializeView(){
//    }
    

}
//extension PrivacyPolicyVC: WKNavigationDelegate{
//    private func setupWebView(){
//        let url = URL(string: "https://developer.apple.com/documentation/webkit")
//        let request = URLRequest(url: url!)
//        webView.load(request)
//        webView.allowsBackForwardNavigationGestures = true
//        webView.navigationDelegate = self
//    }
//
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        SVProgressHUD.show(withStatus: "Loading...")
//    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        SVProgressHUD.dismiss()
//    }
//
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        SVProgressHUD.dismiss()
//    }
//}
}
