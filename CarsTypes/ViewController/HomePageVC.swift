//
//  HomePageVC.swift
//  CarsTypes
//
//  Created by Hla Alhelou on 15/12/2021.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var displayHomeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CellRegistration()
        displayHomeTable.delegate =  self
        displayHomeTable.dataSource = self
        
        
    }
    
    func CellRegistration() {
        let cell = UINib(nibName: "homePage", bundle: nil)
        displayHomeTable.register(cell, forCellReuseIdentifier: "homePage")

    }
   
}

extension HomePageVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:homePage = displayHomeTable.dequeueReusableCell(withIdentifier: "homePage") as! homePage
        return cell
    }
    
    
    
}
