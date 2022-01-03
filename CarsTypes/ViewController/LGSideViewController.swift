//  LGSideViewController.swift

//  Copyright © 2020 macbook. All rights reserved.
//
import UIKit
import LGSideMenuController


class LGSideViewController: LGSideMenuController {
    let rootVC = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "HomePageVC")
    let leftVC = UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: "MenuVC")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
  
    }
}
extension LGSideViewController{
    
    func  setUpView(){
        self.rootViewController=self.rootVC

        self.leftViewController = self.leftVC
        self.leftViewWidth = UIScreen.main.bounds.width * 0.9;
        self.leftViewPresentationStyle = .slideBelow

        print("jhgkljlkhhjck")
    }
    
}
