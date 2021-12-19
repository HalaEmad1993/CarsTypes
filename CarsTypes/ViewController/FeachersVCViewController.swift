//
//  FeachersVCViewController.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 16/12/2021.
//

import UIKit

class FeachersVCViewController: UIViewController {

    @IBOutlet weak var FeachersCellRegistration: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
        FeachersCellRegistration.dataSource = self
        FeachersCellRegistration.delegate = self
        print("hgjhkhklkl")
        print("hgjhkhklkl")
        print("hgjhkhklkl")
        print("hgjhkhklkl")
        print("hgjhkhklkl")

    }
    
    func cellRegistration() {
        let cell = UINib(nibName: "FeachersCell", bundle: nil)
        FeachersCellRegistration.register(cell, forCellReuseIdentifier: "FeachersCell")
  

}
}
extension FeachersVCViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : FeachersCell = FeachersCellRegistration.dequeueReusableCell(withIdentifier: "FeachersCell") as! FeachersCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 22
    }
}
