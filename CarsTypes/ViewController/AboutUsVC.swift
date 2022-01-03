//
//  AboutUsVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 21/12/2021.
//

import UIKit
import WebKit
class AboutUsVC: UIViewController {

    @IBOutlet weak var aboutUsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutUs()

    }

}

extension AboutUsVC {
    func aboutUs () {
        UserApiController.AboutUs { status, message in
            if status == true {
                self.aboutUsText.text = message
            }
        }
    }
}
