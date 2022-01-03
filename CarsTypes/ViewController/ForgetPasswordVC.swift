//
//  ForgetPasswordVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 01/01/2022.
//

import UIKit

class ForgetPasswordVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func sendEmailButton(_ sender: Any) {
        if !emailText.text!.isEmpty {
            sendEmail(email: emailText.text!)

        }else{
            showAlertMessage(title: "Notice", message: "Enter your email")

        }
    }
    

}

extension ForgetPasswordVC{
    func sendEmail(email:String){
        UserApiController.sendEmail(email: email) { status, message in
            if status == true{
                self.showAlertMessage(title: "Sucess", message: message)

            }else{
                self.showAlertMessage(title: "Failed", message: message)
        }
        }
    }
    
    
}
