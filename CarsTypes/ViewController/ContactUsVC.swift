//
//  ContactUsVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 01/01/2022.
//

import UIKit

class ContactUsVC: UIViewController {

    @IBOutlet weak var subjectText: UITextField!
    @IBOutlet weak var messText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func contactButton(_ sender: Any) {
        if !subjectText.text!.isEmpty && !messText.text!.isEmpty{
            contact(subject: subjectText.text!, message: messText.text!)

        }else {
            showAlertMessage(title: "Error", message: "Fill All Required Data Please")
        }
    }
    
}
extension ContactUsVC {
    func contact (subject:String,message:String) {
        UserApiController.ContactUs(title: subject, message: message) { status, message in
            if status == true {
                self.showAlertMessage(title: "success", message: message)
            } else {
                self.showAlertMessage(title: "Failed", message: message)
            }
        }
        
    }
}
