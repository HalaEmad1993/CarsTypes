//
//  SignUp.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit
import SVProgressHUD
class SignUpVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var selectedImage:UIImage?
    var user:UserData?

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var telephoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func backButton(_ sender: Any) {
//        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "LogInVC")
//        navigationController?.popToViewController(vc, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        if checkData() {
            signUp()

        }else{
            
        }
        
        
        
    }
    @IBAction func cameraAction(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                picker.allowsEditing = true
                present(picker,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return  }
        print(image)
        selectedImage = image
        userImg.image = image

        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
}
extension SignUpVC {
    public func checkData()-> Bool {

        if !firstNameTF.text!.isEmpty && !emailTF.text!.isEmpty && !telephoneTF.text!.isEmpty && !passwordTF.text!.isEmpty && !confirmPasswordTF.text!.isEmpty  && !addressTF.text!.isEmpty  {
            return true
            
        }else{
            showAlertMessage(title: "Error", message: "Please enter  All required data")
            return false
            
        }
        
    }
    

    private func signUp(){

                self.user = UserData(name: self.firstNameTF.text!, mobile: self.telephoneTF.text!, profileImg: self.selectedImage!, address: self.addressTF.text ?? "", password: self.passwordTF.text!, confirmPassword: self.confirmPasswordTF.text!, email: self.emailTF.text!)
        
        
                guard let _user = self.user else {return}
        
                           SVProgressHUD.show()
        
        
        
                           UserApiController.register(user: _user) { (status,message) in
                                    if status == true{
                                        SVProgressHUD.dismiss()

                                        self.showAlertMessage(title: "Sayarat", message: message)
                                     
                                            self.clear ()
                                            
                                        }else{
                                        SVProgressHUD.dismiss()
                                        self.showAlertMessage(title: "Sayarat", message: message)

                                    }
                             }

            }

    func clear (){
        firstNameTF.text = ""
        emailTF.text = ""
        telephoneTF.text = ""
        passwordTF.text = ""
        confirmPasswordTF.text = ""
        addressTF.text = ""

    }

}

