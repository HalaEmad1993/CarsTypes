//
//  SignUp.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class SignUp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func backButton(_ sender: Any) {
//        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "LogInVC")
//        navigationController?.popToViewController(vc, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    
}
