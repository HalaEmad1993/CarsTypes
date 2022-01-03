//
//  ChangePasswordVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 01/01/2022.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButton(_ sender: Any) {
        
        if  checkData(){
            changePass(oldPass: oldPassword.text!, newPass: newPassword.text!, confirmPass: confirmPassword.text!)
            
        }
    }
    

}
extension ChangePasswordVC {
    func changePass (oldPass:String,newPass:String,confirmPass:String) {
        UserApiController.changePassword(oldPass: oldPass, newPass: newPass, confirmPass: confirmPass) { status, message in
            if status == true {
                self.showAlertMessage(title: "Success", message: message)
                
            }else{
                self.showAlertMessage(title: "failed", message: message)
            }
        }
        
    }
    
    func checkData () -> Bool {
        if !oldPassword.text!.isEmpty && !newPassword.text!.isEmpty && !confirmPassword.text!.isEmpty{
            if oldPassword.text! != newPassword.text! && newPassword.text! == confirmPassword.text! {
          return true
                
            }else{
                showAlertMessage(title: "Error", message: "New Password should be Different")
                return false
            }
          

        }else{
            showAlertMessage(title: "Error", message: "Fill All Required Texts")
            return false

        }
       

    }
}
