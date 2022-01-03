//
//  LogInVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class LogInVC: UIViewController {

  
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logInButton(_ sender: Any) {
        if checkData() {
            logIn()
        }else{
            showAlertMessage(title: "Notice", message: "Fill Email and Password ")
        }
        
        
        
    }
    
    
    @IBAction func forgetPasswordButton(_ sender: Any) {
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "ForgetPasswordVC")
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func signUp(_ sender: UIButton) {
    }
    
}
    extension LogInVC{
        
        func checkData () -> Bool{
            if !passwordTF.text!.isEmpty && !emailTF.text!.isEmpty {
                return true
            }else {
                return false
            }
        }
        
    

    
func logIn () {
    UserApiController.LoginRequest(email: emailTF.text!, password: passwordTF.text!) { userData, status in
    
        if status == true {
            guard let  _user = userData else {return}
            UserDefaults.standard.setValue("Bearer \(_user.access_token!)", forKey: "Token")
            let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "LGSideViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            self.showAlertMessage(title: "error!", message: "Email or Password not correct")
        }
        
    }
}
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//}
//extension LogInVC{
//    public func checkData()-> Bool {
//
//        if !emailTxtfield.text!.isEmpty && !passwordTxtfield.text!.isEmpty {
//            return true
//        }else{
//            showAlertMessage(title: "Error", message: "Please enter  All required data")
//
//        }
//        return false
//    }
//    public func performLogin(){
//        UserApiController.Login(email: emailTxtfield.text!, password: passwordTxtfield.text!) { (user, status) in
//            if status{
//                if let _user = user{
//                    UserDefaults.standard.setValue("Bearer \(_user.access_token!)", forKey: "Token")
//                    self.hideLoading()
//                    self.goToHomeVC()
//
//                }
//
//            }else{
//                self.hideLoading()
//
//                self.showAlertMessage(title: "Error", message: "User not found")
//            }
//
//
//        }
//    }
//    private func goToHomeVC(){
//        let vc=UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "LGSideViewControllers")
//        self.navigationController?.pushViewController(vc, animated: true)
