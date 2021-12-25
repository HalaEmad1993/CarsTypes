//
//  LogInVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class LogInVC: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logInButton(_ sender: Any) {
//        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp")
        let vc = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "SignUp")
        
        navigationController?.pushViewController(vc, animated: true)
    }

    
}
