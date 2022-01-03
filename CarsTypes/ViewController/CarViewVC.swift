//
//  CarViewVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 26/12/2021.
//

import UIKit
import FSPagerView

class CarViewVC: UIViewController {
    
    var name:[String]=["1-1","cars-1","1-1","cars-1","logo"]

    @IBOutlet weak var CarView: UIView!
//        didSet {
//               self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
//               self.pagerView.itemSize = FSPagerView.automaticSize
//           }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
}
