//
//  EditProfileViewController.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 30/12/2021.
//

import UIKit
import SVProgressHUD
import SDWebImage
class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var selectedImage:UIImage?
    var profile : Profile?
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var editImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfile ()
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
        editImage.image = image

            }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func save(_ sender: Any) {
        
        editProfile ()
    }
    

}
extension EditProfileViewController{
    
    func getProfile () {
        UserApiController.GetProfile { status, userdata in
            if status == true {
                self.name.text = userdata?.name
                self.email.text = userdata?.email
                self.phone.text = userdata?.mobile
                self.address.text = userdata?.address
                self.editImage.sd_setImage(with:URL(string: "\(userdata?.image_profile)"))
                
            }
        }
    }
    func editProfile () {
        profile=Profile(name: name.text!, mobile: phone.text!, profileImg: editImage.image!, address: address.text!, email:email.text!)
        
        guard let user = profile else {return}
        
        
        UserApiController.EditProfile(user: user) { status, message in
            if status == true {
                self.showAlertMessage(title: "success", message: message)
            }else{
                self.showAlertMessage(title: "failed", message: message)

            }
            
            
        }
    }
    
    
    
//
//    public func getDataProfile(){
//        internetConnectionChecker { (status) in
//            if status{
//                SVProgressHUD.showLoading()
//        UserApiController.GetProfile { (status, user) in
//            if status{
//
//            self.hideLoading()
//            self.userImage.sd_setImage(with: URL(string: user?.image_profile ?? ""))
//            self.fullNametxt.text = user?.name
//            self.address.text = user?.address
//            self.emailtxt.text = user?.email
//            self.phoneNum.text = user?.mobile
//
//
//        }
//            SVProgressHUD.hideLoading()
//
//        }
//            }else{
//                self.showAlertMessage(title: "Error", message: "No internet connection")
//            }
//        }
//    }
    private func goToHomeVC(){
        let vc=UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "LGSideViewControllers")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//    public func editData(){
//        internetConnectionChecker { (status) in
//            if status{
//                self.showLoading()
//                self.profileData = Profile(name: self.fullNametxt.text!, mobile: self.allNumber, profileImg: self.userImage.image!, address: self.address.text!, email: self.emailtxt.text!)
//                guard  let _user = self.profileData else {return}
//        MenuApiController.EditProfile(user: _user) { (status, message) in
//
//            self.hideLoading()
//
//                self.showAlertMessage(title: "Sayarat", message: message)
//
//                  }
//
//
//            }else{
//                self.showAlertMessage(title: "Error", message: "No internet connection")
//
//            }
//
//        }
//    }
}
